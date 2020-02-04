package com.keycloak.model;

public class OtpDTO {
	private String data;
	private String status;
	private Response response;

	public static class Response {
		private String responsecode;

		private String responsemessage;

		public String getResponsecode() {
			return responsecode;
		}

		public void setResponsecode(String responsecode) {
			this.responsecode = responsecode;
		}

		public String getResponsemessage() {
			return responsemessage;
		}

		public void setResponsemessage(String responsemessage) {
			this.responsemessage = responsemessage;
		}
		@Override
		public String toString() {
			return "response {responsecode=" + responsecode + ", responsemessage=" + responsemessage + "}";
		}
	}

	public Response getResponse() {
		return response;
	}

	public void setResponse(Response response) {
		this.response = response;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
