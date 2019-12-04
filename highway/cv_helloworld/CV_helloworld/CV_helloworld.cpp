#include <iostream>
#include <opencv2/opencv.hpp>
#include <string>
#include <opencv2/core/core.hpp>  
#include <opencv2/highgui/highgui.hpp>  
#include<numeric>

using namespace cv;
using namespace std;
vector<string> Input_fn; 

#define n 100
//#define TH 0.078f    //20
//#define TH 0.196f    //50
#define TH 0.392f    //100

Mat img2binary(Mat img)
{
	img.convertTo(img, CV_32FC3, 1 / 255.0);		// 转f32
	cvtColor(img, img, COLOR_BGR2GRAY);
	threshold(img, img, 0.5f, 1.0f, THRESH_BINARY);		//Groundtruth 转2值
	return img;
}

string num2str(int i)
{
	char ss[10];
	sprintf_s(ss, "%05d", i);
	return ss;
}

vector<Mat> mean_filter(void)
{
	vector<Mat> mean_result;
	deque<Mat> Img_buf;

	Mat mask;

	for (int i = 0; i < Input_fn.size(); i++)
	{
		Mat img = imread(Input_fn[i]);

		img.convertTo(img, CV_32FC3, 1 / 255.0);		// 转f32
		if (i >= n)
		{
			Mat temp = Img_buf[0].clone();
			for (int j = 1; j < Img_buf.size(); j++)
			{
				temp = temp + Img_buf[j];
			}
			mask = abs(img - temp/n);					// 当前减去前n个的平均
 			cvtColor(mask, mask, COLOR_BGR2GRAY);
			threshold(mask, mask, TH, 1.0f, THRESH_BINARY);
			mean_result.push_back(mask);
			// 写图片
			mask.convertTo(mask, CV_8UC3, 255.0);
			string suffix = ".png";
			string wdir = "..\\highway\\mean_mask\\100\\mask_" + num2str(i) + suffix;
			imwrite(wdir,mask);

			Img_buf.pop_front();
		}
		Img_buf.push_back(img);

	}
	return mean_result;
}

vector<Mat> momentum_filter(void)
{
	vector<Mat> momentum_result;

	Mat mask;
	Mat temp = imread(Input_fn[0]);
	temp.convertTo(temp, CV_32FC3, 1 / 255.0);
	for (int i = 1; i < Input_fn.size(); i++)
	{
		Mat img = imread(Input_fn[i]);
		img.convertTo(img, CV_32FC3, 1 / 255.0);		// 转f32

		temp = 0.9*temp + 0.1*img;
		mask = abs(img - temp);
		cvtColor(mask, mask, COLOR_BGR2GRAY);
		threshold(mask, mask, TH, 1.0f, THRESH_BINARY);

		// 写图片
		mask.convertTo(mask, CV_8UC3, 255.0);
		string suffix = ".png";
		string wdir = "..\\highway\\momentum_mask\\100\\mask_" + num2str(i) + suffix;
		imwrite(wdir, mask);

		momentum_result.push_back(mask);
	}
	return momentum_result;
}



vector<float> cal_IoU(string mask_dir,string groundtruth_dir,bool flag)
{
	vector<string> Groundtruth_fn,mask_fn;

	vector<float> IoU;
	glob(groundtruth_dir, Groundtruth_fn, false);
	glob(mask_dir, mask_fn, false);

	for (int i = 470; i < Groundtruth_fn.size()-n; i++) // 从470开始
	{
		Mat img_gt;
		if (flag == 1)
			img_gt = imread(Groundtruth_fn[i + n]);			// GT 和 mask 照片对齐
		else
			img_gt = imread(Groundtruth_fn[i]);
		Mat mask = imread(mask_fn[i]);

		img_gt = img2binary(img_gt);  // 2值 f32
		mask = img2binary(mask);

		float I = countNonZero(img_gt & mask);
		float U = countNonZero(img_gt | mask);
		float iou = I / U;
		IoU.push_back(iou);
	}
	return IoU;
}

float getAvg(vector<float> iou)
{
	return accumulate(iou.begin(), iou.end(), 0.0)/iou.size();

}

int main()
{
	string Input_dir = "..\\highway\\input\\*.jpg";
	string Groundtruth_dir = "..\\highway\\groundtruth\\*.png";
	string mean_mask_th_20_dir = "..\\highway\\mean_mask\\20\\*.png";
	string mean_mask_th_50_dir = "..\\highway\\mean_mask\\50\\*.png";
	string mean_mask_th_100_dir = "..\\highway\\mean_mask\\100\\*.png";
	string momentum_mask_th_20_dir = "..\\highway\\momentum_mask\\20\\*.png";
	string momentum_mask_th_50_dir = "..\\highway\\momentum_mask\\50\\*.png";
	string momentum_mask_th_100_dir = "..\\highway\\momentum_mask\\100\\*.png";


	vector<Mat> images;
	Mat temp;
	glob(Input_dir, Input_fn, false);

// 写图像的时候调用
	/*vector<Mat> mean_bg = mean_filter();
	vector<Mat> momentum_bg = momentum_filter();*/


	vector<float> mean_20 = cal_IoU(mean_mask_th_20_dir, Groundtruth_dir,1);
	vector<float> mean_50 = cal_IoU(mean_mask_th_50_dir, Groundtruth_dir,1);
	vector<float> mean_100 = cal_IoU(mean_mask_th_100_dir, Groundtruth_dir,1);
	vector<float> momt_20 = cal_IoU(momentum_mask_th_20_dir, Groundtruth_dir,0);
	vector<float> momt_50 = cal_IoU(momentum_mask_th_50_dir, Groundtruth_dir,0);
	vector<float> momt_100 = cal_IoU(momentum_mask_th_100_dir, Groundtruth_dir,0);

	float IoU1 = getAvg(mean_20);
	float IoU2 = getAvg(mean_50);
	float IoU3 = getAvg(mean_100);
	float IoU4 = getAvg(momt_20);
	float IoU5 = getAvg(momt_50);
	float IoU6 = getAvg(momt_100);

	cout << "mean_filter TH = 20    " << "\t"<<IoU1<<endl;
	cout << "mean_filter TH = 50    " << "\t" << IoU2 << endl;
	cout << "mean_filter TH = 100   " << "\t" << IoU3 << endl;
	cout << "momentum_filter TH = 20" << "\t" << IoU4 << endl;
	cout << "momentum_filter TH = 500" << "\t" << IoU5 << endl;
	cout << "momentum_filter TH = 100" << "\t" << IoU6 << endl;

	waitKey(-1);
	return 0;
}