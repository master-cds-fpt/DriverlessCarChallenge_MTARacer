//get image from astra and write to video file
//#include "opencv2/videoio/videoio.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <iomanip>
#include <fstream>
#include <stdio.h>
#include <OpenNI.h>
#include <termios.h>

using namespace std;
using namespace cv;
using namespace openni;


#define SAMPLE_READ_WAIT_TIMEOUT 2000 //2000ms
#define VIDEO_FRAME_WIDTH 640
#define VIDEO_FRAME_HEIGHT 480

VideoWriter depth_videoWriter;
VideoWriter bgr_videoWriter;
bool is_save_file = true;

int
getkey()
{
    int character;
    struct termios orig_term_attr;
    struct termios new_term_attr;

    /* set the terminal to raw mode */
    tcgetattr(fileno(stdin), &orig_term_attr);
    memcpy(&new_term_attr, &orig_term_attr, sizeof(struct termios));
    new_term_attr.c_lflag &= ~(ECHO|ICANON);
    new_term_attr.c_cc[VTIME] = 0;
    new_term_attr.c_cc[VMIN] = 0;
    tcsetattr(fileno(stdin), TCSANOW, &new_term_attr);

    /* read a character from the stdin stream without blocking */
    /*   returns EOF (-1) if no character is available */
    character = fgetc(stdin);

    /* restore the original terminal attributes */
    tcsetattr(fileno(stdin), TCSANOW, &orig_term_attr);

    return character;
}



void analyzeFrame(const VideoFrameRef& frame)
{
    DepthPixel* depth_img_data;
    RGB888Pixel* color_img_data;

    int w = frame.getWidth();
    int h = frame.getHeight();

	cout<<"width:"<<w<<";height:"<<h<<endl;
    Mat depth_img(h, w, CV_16U);
    Mat depth_img_8u;
    Mat color_img(h, w, CV_8UC3);
	
    switch (frame.getVideoMode().getPixelFormat())
    {
    case PIXEL_FORMAT_DEPTH_1_MM:
    case PIXEL_FORMAT_DEPTH_100_UM:

        depth_img_data = (DepthPixel*)frame.getData();

        memcpy(depth_img.data, depth_img_data, h*w*sizeof(DepthPixel));

        normalize(depth_img, depth_img_8u, 255, 0, NORM_MINMAX);

        depth_img_8u.convertTo(depth_img_8u, CV_8U);
		
		if ((is_save_file)&&(!depth_img_8u.empty()))
           depth_videoWriter.write(depth_img_8u);

      //  imshow("depth", depth_img_8u);
        break;
    case PIXEL_FORMAT_RGB888:
        color_img_data = (RGB888Pixel*)frame.getData();

        memcpy(color_img.data, color_img_data, h*w*sizeof(RGB888Pixel));

        cvtColor(color_img, color_img, COLOR_RGB2BGR);

		if ((is_save_file)&&(!color_img.empty()))
			bgr_videoWriter.write(color_img);
		
        imshow("bgr", color_img);
        break;
    default:
        printf("Unknown format\n");
    }
}


int main()
{
	
    Status rc = OpenNI::initialize();
    if (rc != STATUS_OK)
    {
        printf("Initialize failed\n%s\n", OpenNI::getExtendedError());
        return 1;
    }

    Device device;
    rc = device.open(ANY_DEVICE);
    if (rc != STATUS_OK)
    {
        printf("Couldn't open device\n%s\n", OpenNI::getExtendedError());
        return 2;
    }

    VideoStream depth, color;

    if (device.getSensorInfo(SENSOR_DEPTH) != NULL)
    {
        rc = depth.create(device, SENSOR_DEPTH);
        if (rc == STATUS_OK)
        {
            VideoMode depth_mode = depth.getVideoMode();
            depth_mode.setFps(30);
            depth_mode.setResolution(640, 480);
            depth_mode.setPixelFormat(PIXEL_FORMAT_DEPTH_100_UM);
            depth.setVideoMode(depth_mode);

            rc = depth.start();
            if (rc != STATUS_OK)
            {
                printf("Couldn't start the color stream\n%s\n", OpenNI::getExtendedError());
            }
        }
        else
        {
            printf("Couldn't create depth stream\n%s\n", OpenNI::getExtendedError());
        }
    }

    if (device.getSensorInfo(SENSOR_COLOR) != NULL)
    {
        rc = color.create(device, SENSOR_COLOR);
        if (rc == STATUS_OK)
        {
            VideoMode color_mode = color.getVideoMode();
            color_mode.setFps(30);
            color_mode.setResolution(640, 480);
            color_mode.setPixelFormat(PIXEL_FORMAT_RGB888);
            color.setVideoMode(color_mode);

            rc = color.start();
            if (rc != STATUS_OK)
            {
                printf("Couldn't start the color stream\n%s\n", OpenNI::getExtendedError());
            }
        }
        else
        {
            printf("Couldn't create color stream\n%s\n", OpenNI::getExtendedError());
        }
    }

    VideoFrameRef frame;

    VideoStream* streams[] = {&depth, &color};

	int codec = CV_FOURCC('D','I','V', 'X');
    Size output_size(VIDEO_FRAME_WIDTH, VIDEO_FRAME_HEIGHT);

    string depth_filename = "depth.avi";
	string bgr_filename = "bgr.avi";
    
    Mat depthMap;
	Mat bgrImage;

    Mat crop_depthMap;
    Mat crop_grayImage;

    char key = 0;

    bool start = false;
    bool stop = false;

    if(is_save_file)
    {
        depth_videoWriter.open(depth_filename, codec, 24, output_size, false);
		bgr_videoWriter.open(bgr_filename, codec, 24, output_size, true);
    }

	cout<< " Press s to start and f to stop"<< endl<< flush;
	
    while (true)
    {
		key = getkey();
        if( key == 's')
            start = true;
        if( key == 'f')
            stop = true;
        if( stop ) break;

        if( start )
        {       
		    int readyStream = -1;
		    rc = OpenNI::waitForAnyStream(streams, 2, &readyStream, SAMPLE_READ_WAIT_TIMEOUT);
		    if (rc != STATUS_OK)
		    {
		        printf("Wait failed! (timeout is %d ms)\n%s\n", SAMPLE_READ_WAIT_TIMEOUT, OpenNI::getExtendedError());
		        break;
		    }

		    switch (readyStream)
		    {
		    case 0:
		        // Depth
		        depth.readFrame(&frame);
		        break;
		    case 1:
		        // Color
		        color.readFrame(&frame);
		        break;
		    default:
		        printf("Unxpected stream\n");
		    }

		    analyzeFrame(frame);

		    char key = waitKey(1);

		    if( key == 27 ) break;
		}
    }

	if(is_save_file )
    {
        depth_videoWriter.release();
		bgr_videoWriter.release();
    }

    depth.stop();
    color.stop();
    depth.destroy();
    color.destroy();
    device.close();
    OpenNI::shutdown();

    return 0;
}
