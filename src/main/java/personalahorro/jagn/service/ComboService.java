package personalahorro.jagn.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import personalahorro.jagn.domain.ComboKV;
import personalahorro.jagn.repository.ComboRepository;

@Service
public class ComboService {

	@Autowired
	private ComboRepository comboRepository;

	public Map<String, List<ComboKV>> searchCombos() {

		Map<String, List<ComboKV>> mapaCombos = new HashMap<>();

		List<ComboKV> comboTotalParams = castComboKV(comboRepository.getComboTotalParams());
		mapaCombos.put("comboTotalParams", comboTotalParams);

		comboTotalParams.forEach(item -> {
			mapaCombos.put("comboSubderivados" + item.getKey(),
					castComboKV(comboRepository.getComboDerivadoParamsByTotal(item.getKey())));
		});

		return mapaCombos;
	}

	private List<ComboKV> castComboKV(List<Object[]> listObject) {
		List<ComboKV> listConKV = new ArrayList<>();
		if (!listObject.isEmpty()) {
			int listConSize = listObject.size();
			for (int contListCon = 0; contListCon < listConSize; contListCon++) {
				ComboKV comboKV = new ComboKV();
				comboKV.setKey(listObject.get(contListCon)[0].toString());
				comboKV.setValue(listObject.get(contListCon)[1].toString());
				listConKV.add(comboKV);
			}
		}
		return listConKV;
	}
}
