package com.sist.spring.cmn;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
	private final Logger LOG = LoggerFactory.getLogger(DownloadView.class);

	public DownloadView() {
		setContentType("application/download;charset=utf-8");
	}

	// 파일명 지정
	private void setDownloadFileName(String fileName, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		// 브라우저 정보:IE /None IE
		String userAgent = request.getHeader("User-Agent");
		LOG.debug("2-----------------------");
		LOG.debug("2-userAgent-" + userAgent);
		LOG.debug("2-fileName-" + fileName);
		LOG.debug("2-----------------------");

		boolean idIe = (userAgent.indexOf("Trident") != -1);
		if (idIe == true) {
			fileName = URLEncoder.encode(fileName, "utf-8");
			LOG.debug("2-fileName URLEncoder.encode-" + fileName);
		} else {
			fileName = URLEncoder.encode(fileName, "utf-8");
			LOG.debug("2-fileName URLEncoder.encode-" + fileName);
		}

		response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
	}

	// 파일 다운로드
	private void downloadFile(File downloadFile, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		FileInputStream in = new FileInputStream(downloadFile);
		OutputStream out = response.getOutputStream();
		try {
			FileCopyUtils.copy(in, out);
			out.flush();
			
		} catch (IOException e) {
			throw e;
		} finally {
			try {
				if (null != in) {
					in.close();
				}
			} catch (IOException e) {

			}
			
			try {
				if (null != out) {
					out.close();
				}
			} catch (IOException e) {

			}			
		}

	}

	// DownloadView 진입 메소드:1
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {

			setResponseContentType(request, response);
			File downloadFile = (File) model.get("downloadFile");
			String orgFileNm = (String) model.get("orgFileNm");
			LOG.debug("1-renderMergedOutputModel-");
			LOG.debug("1-orgFileNm-" + orgFileNm);
			LOG.debug("1-downloadFile----------------" + downloadFile.getName());
			LOG.debug("1-length-------------" + downloadFile.length());
			LOG.debug("1--------------------------");

			// 원본파일로 파일명 변경.
			setDownloadFileName(orgFileNm, request, response);

			response.setContentLength((int) downloadFile.length());

			this.downloadFile(downloadFile, request, response);

		} catch (Exception e) {
			throw e;
		}

	}

}
