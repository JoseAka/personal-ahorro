package personalahorro.jagn.util;

import org.springframework.web.multipart.MultipartFile;

public class Util {

	private Util() {

	}

	public static boolean hasXlsxFormat(MultipartFile file) {
		return Constantes.TYPE_XLXS.equalsIgnoreCase(file.getContentType());
	}
}
