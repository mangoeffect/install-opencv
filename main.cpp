/**
 * @file main.cpp
 * @author mango (2321544362@qq.com)
 * @brief 
 * @version 0.1
 * @date 2021-10-14
 * 
 * @copyright Copyright (c) 2021
 * 
 */

 #include <iostream>
 #include "opencv2/opencv.hpp"

 int main(int argc, char** argv)
 {
     std::cout << cv::getBuildInformation() << std::endl;
     return 0;
 }