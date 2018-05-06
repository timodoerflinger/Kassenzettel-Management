//
//  OpenCVWrapper.m
//  OpenCImageStitching2
//
//  Created by Timo on 22.04.18.
//  Copyright © 2018 Timo. All rights reserved.
//

#import "OpenCVWrapper.h"

//#import <opencv2/opencv.hpp>
#include "opencv2/stitching.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgcodecs.hpp"

#import <opencv2/calib3d.hpp>
#import <opencv2/features2d.hpp>
#import <opencv2/imgproc/imgproc.hpp>


#import "opencv2/imgcodecs/ios.h"
#import "opencv2/stitching.hpp"

#import "stitching.h"
#import "UIImage+OpenCV.h"
#import "UIImage+Rotate.h"

@interface OpenCVWrapper ()

@end

@implementation OpenCVWrapper

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


+(UIImage *) makeGrayFromImage2:(UIImage *) image{
    
    cv::Mat imageMat;
    UIImageToMat(image, imageMat);
    
    if(imageMat.channels()==1) return image;
    
    cv::Mat grayMat;
    cv::cvtColor(imageMat, grayMat, CV_BGR2GRAY);
    
    return MatToUIImage(grayMat);
    
}





+ (UIImage*) processImageWithOpenCV: (UIImage*) inputImage
{
    NSArray* imageArray = [NSArray arrayWithObject:inputImage];
    UIImage* result = [[self class] processWithArray:imageArray];
    return result;
}

+ (UIImage*) processWithOpenCVImage1:(UIImage*)inputImage1 image2:(UIImage*)inputImage2;
{
    NSArray* imageArray = [NSArray arrayWithObjects:inputImage1,inputImage2,nil];
    UIImage* result = [[self class] processWithArray:imageArray];
    return result;
}

+ (UIImage*) processWithArray:(NSArray*)imageArray
{
    if ([imageArray count]==0){
        NSLog (@"imageArray is empty");
        return 0;
    }
    std::vector<cv::Mat> matImages;
    
    for (id image in imageArray) {
        if ([image isKindOfClass: [UIImage class]]) {
            /*
             All images taken with the iPhone/iPa cameras are LANDSCAPE LEFT orientation. The  UIImage imageOrientation flag is an instruction to the OS to transform the image during display only. When we feed images into openCV, they need to be the actual orientation that we expect them to be for stitching. So we rotate the actual pixel matrix here if required.
             */
            UIImage* rotatedImage = [image rotateToImageOrientation];
            cv::Mat matImage = [rotatedImage CVMat3];
            NSLog (@"matImage: %@",image);
            matImages.push_back(matImage);
        }
    }
    NSLog (@"stitching...");
    cv::Mat stitchedMat = stitch (matImages);
    UIImage* result =  [UIImage imageWithCVMat:stitchedMat];
    return result;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
