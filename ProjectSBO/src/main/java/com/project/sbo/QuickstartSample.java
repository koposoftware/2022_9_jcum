package com.project.sbo;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.Credentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageAnnotatorSettings;
import com.google.protobuf.ByteString;

public class QuickstartSample {
	
	@Autowired
	static
	ResourceLoader resourceLoader;

	
	public static void main(String... args) throws Exception {
//		try (ImageAnnotatorClient vision = ImageAnnotatorClient.create(getImageAnnotatorSettings())) {
//
//			// The path to the image file to annotate
//			String fileName = "c:/resource/aaaa.jpg";
//
//			// Reads the image file into memory
//			Path path = Paths.get(fileName);
//			byte[] data = Files.readAllBytes(path);
//			ByteString imgBytes = ByteString.copyFrom(data);
//
//			// Builds the image annotation request
//			List<AnnotateImageRequest> requests = new ArrayList<>();
//			Image img = Image.newBuilder().setContent(imgBytes).build();
//			
//			Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
//			
//			
//			AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
//			requests.add(request);
//
//			// Performs label detection on the image file
//			BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
//			List<AnnotateImageResponse> responses = response.getResponsesList();
//
//			for (AnnotateImageResponse res : responses) {
//				if (res.hasError()) {
//					System.out.format("Error: %s%n", res.getError().getMessage());
//					return;
//				}
//
//				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
//					annotation.getAllFields().forEach((k, v) -> System.out.format("%s : %s%n", k, v.toString()));
//				}
//			}
//		}
		detectText();
		
	}
	
	public static ImageAnnotatorSettings getImageAnnotatorSettings() throws FileNotFoundException, IOException{
		ResourceLoader loader = new DefaultResourceLoader();
	    Resource resource = loader.getResource("classpath:key.json");	
		
	    //System.out.println(resource.exists());
		 
		Credentials myCredentials = ServiceAccountCredentials.fromStream(resource.getInputStream());
		ImageAnnotatorSettings imageAnnotatorSettings = ImageAnnotatorSettings.newBuilder().
				setCredentialsProvider(FixedCredentialsProvider.create(myCredentials)).build();
		
		return imageAnnotatorSettings;
	}
	
	
	public static void detectText() throws IOException {
	    // TODO(developer): Replace these variables before running the sample.
	    String filePath = "c:/resource/aaaa.jpg";
	    detectText(filePath);
	  }

	  // Detects text in the specified image.
	  public static void detectText(String filePath) throws IOException {
	    List<AnnotateImageRequest> requests = new ArrayList<>();

	    ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

	    Image img = Image.newBuilder().setContent(imgBytes).build();
	    Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
	    AnnotateImageRequest request =
	        AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	    requests.add(request);

	    // Initialize client that will be used to send requests. This client only needs to be created
	    // once, and can be reused for multiple requests. After completing all of your requests, call
	    // the "close" method on the client to safely clean up any remaining background resources.
	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create(getImageAnnotatorSettings())) {
	      BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
	      List<AnnotateImageResponse> responses = response.getResponsesList();

	      for (AnnotateImageResponse res : responses) {
	        if (res.hasError()) {
	          System.out.format("Error: %s%n", res.getError().getMessage());
	          return;
	        }

	        // For full list of available annotations, see http://g.co/cloud/vision/docs
	        for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
	          System.out.format("Text: %s%n", annotation.getDescription());
	          System.out.format("Position : %s%n", annotation.getBoundingPoly());
	        }
	      }
	    }
	  }
	
}