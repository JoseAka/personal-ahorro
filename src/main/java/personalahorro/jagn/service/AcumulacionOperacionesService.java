package personalahorro.jagn.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import personalahorro.jagn.domain.AcumulacionOperacionesResponse;
import personalahorro.jagn.domain.BBVACsv;
import personalahorro.jagn.domain.ConceptosEstructuradosRequest;
import personalahorro.jagn.domain.ConceptosEstructuradosResponse;
import personalahorro.jagn.domain.OperacionesRequest;
import personalahorro.jagn.entity.AcumulacionOperaciones;
import personalahorro.jagn.exception.PersonalAhorroException;
import personalahorro.jagn.repository.AcumulacionOperacionesRepository;
import personalahorro.jagn.repository.EstructurasCondicionadasRepository;
import personalahorro.jagn.util.Constantes;
import personalahorro.jagn.util.Util;

@Service
@Slf4j
public class AcumulacionOperacionesService {

	@Autowired
	private AcumulacionOperacionesRepository acumulacionOperacionesRepository;

	@Autowired
	private EstructurasCondicionadasRepository transferenciasEstructuradasDefinidasRepository;

	@Autowired
	private ConceptosEstructuradosService conceptosEstructuradosService;

	@Autowired
	private LectorCsvService lectorCsvService;

	public List<AcumulacionOperacionesResponse> getAllConceptos() {

		List<AcumulacionOperacionesResponse> listResponse = new ArrayList<>();

		acumulacionOperacionesRepository.getAllConceptos().forEach(item -> {
			listResponse.add(AcumulacionOperacionesResponse.builder().nombreConcepto(item.getNombreConcepto())
					.plantilla(item.getPlantilla()).build());
		});

		return listResponse;
	}

	public List<AcumulacionOperacionesResponse> getOperaciones(OperacionesRequest operacionesRequest) {

		List<AcumulacionOperacionesResponse> listResponse = new ArrayList<>();

		acumulacionOperacionesRepository.getOperaciones(operacionesRequest).forEach(item -> {
			listResponse.add(AcumulacionOperacionesResponse.builder().idOperacion(item.getIdOperacion()).plantilla(item.getPlantilla())
					.entidad(item.getEntidad()).fechaContable(item.getFechaContable().toString()).fechaValor(item.getFechaValor().toString()).nombreConcepto(item.getNombreConcepto())
					.importe(String.valueOf(item.getImporte())).divisa(item.getDivisaImporte()).observaciones(item.getObservaciones()).build());
		});

		return listResponse;
	}

	@Transactional
	public void acumularOperacion(MultipartFile file) {
		if (lectorCsvService.hasCSVFormat(file)) {

			try {
				List<AcumulacionOperaciones> listAcumulacionOperaciones = new ArrayList<>();

				Map<String, String> conceptosEstructuradosMap = conceptosEstructuradosService.getAll().stream()
						.collect(Collectors.toMap(ConceptosEstructuradosResponse::getNombreConcepto,
								ConceptosEstructuradosResponse::getPlantilla));

				lectorCsvService.readCsvBBVA(file.getInputStream()).stream().distinct().collect(Collectors.toList())
						.forEach(item -> {
							listAcumulacionOperaciones
									.add(getEntityAcumulacionOperaciones(item, conceptosEstructuradosMap));
						});

				listAcumulacionOperaciones.forEach(item -> {
					if (!conceptosEstructuradosMap.containsKey(item.getNombreConcepto())) {
						try {
							conceptosEstructuradosService.save(
									ConceptosEstructuradosRequest.builder().nombreConcepto(item.getNombreConcepto())
											.plantilla(Constantes.ALMOADILLA_BBDD).build());
						} catch (PersonalAhorroException e) {
							e.printStackTrace();
						}
					}
					acumulacionOperacionesRepository.save(item);
				});

			} catch (IOException iOException) {
				throw new RuntimeException("fail to store csv data: " + iOException.getMessage());
			}
		} else {
			log.info("El fichero no tiene formato CSV");
		}
	}

	private String getPlantilla(BBVACsv bbvaCsv, Map<String, String> conceptosEstructuradosMap) {

		if (Constantes.PLANTILLA_ROPA.equalsIgnoreCase(conceptosEstructuradosMap.get(bbvaCsv.getConcepto()))
				&& Double.parseDouble(bbvaCsv.getImporte().replace(',', '.')) > 0) {
			return Constantes.PLANTILLA_TRANSFERENCIA_ENTRANTE;
		} else {
			switch (bbvaCsv.getConcepto()) {
			case Constantes.CONCEPTO_TRANSFERENCIA_REALIZADA:
				return getPlantillaTransferencia(bbvaCsv);
			case Constantes.CONCEPTO_BIZUM:
				return getPlantillaBizum(bbvaCsv);
			default:
				return conceptosEstructuradosMap.getOrDefault(bbvaCsv.getConcepto(), null);
			}
		}

	}

	private String getPlantillaTransferencia(BBVACsv bbvaCsv) {

		List<String> listPlantillas = transferenciasEstructuradasDefinidasRepository.getPlantilla(bbvaCsv);

		return !Util.emptyList(listPlantillas) ? listPlantillas.get(0) : Constantes.PLANTILLA_TRANSFERENCIA_SALIENTE;
	}

	private String getPlantillaBizum(BBVACsv bbvaCsv) {

		if (bbvaCsv.getObservaciones().contains(Constantes.OBSERVACION_BIZUM_ENVIADO)
				|| bbvaCsv.getObservaciones().contains(Constantes.OBSERVACION_BIZUM_DEVUELTO)) {

			List<String> listPlantillas = transferenciasEstructuradasDefinidasRepository.getPlantilla(bbvaCsv);
			return !Util.emptyList(listPlantillas) ? listPlantillas.get(0) : Constantes.PLANTILLA_BIZUM_SALIENTE;
		} else {
			return Constantes.PLANTILLA_BIZUM_ENTRANTE;
		}

	}

	private AcumulacionOperaciones getEntityAcumulacionOperaciones(BBVACsv item,
			Map<String, String> conceptosEstructuradosMap) {
		return AcumulacionOperaciones.builder().plantilla(getPlantilla(item, conceptosEstructuradosMap)).entidad("BBVA")
				.fechaContable(Util.strignToLocalDate(item.getFechaContable()))
				.fechaValor(Util.strignToLocalDate(item.getFechaValor())).nombreConcepto(item.getConcepto())
				.timeStampExecuted(LocalDateTime.now()).importe(Double.parseDouble(item.getImporte().replace(',', '.')))
				.divisaImporte(item.getDivisaImporte())
				.disponible(Double.parseDouble(item.getDisponible().replace(',', '.')))
				.divisaDisponible(item.getDivisaDisponible()).observaciones(item.getObservaciones())
				.timeStampExecuted(LocalDateTime.now()).build();
	}
}
