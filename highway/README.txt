输出IOU结果见result.png
输出图像在 
./cv_helloworld/highway/mean_mask
./cv_helloworld/highway/momentum_mask
分别修改了TH为20/50/100三种情况

源码中 vector<Mat> momentum_filter(void)  和 vector<Mat> mean_filter(void)  函数 
是两种获得mask的方法，其中TH阈值和n平均个数是超参。
评估标准是 vector<float> cal_IoU(string mask_dir,string groundtruth_dir,bool flag)   函数
传入参数是mask和groundtruth路径，标志位判断采用了何种方法，从而进行mask和gt的对其。