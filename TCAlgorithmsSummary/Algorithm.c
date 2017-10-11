//
//  Algorithm.c
//  TCAlgorithmsSummary
//
//  Created by TC on 2017/10/11.
//  Copyright © 2017年 Tommy Chang. All rights reserved.
//

#include "Algorithm.h"

void quickSort(int arr[],int left, int right){
    if (left>right) {
        return;
    }
    int i= left;
    int j = right;
    int key = arr[left];
    //控制在当组内循环一遍
    while (i<j) {
        
        while (i<j && key <= arr[j]) { //找到一个便会停止循环
            /*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
             序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
            j--;       //向前寻找
            
        }
        /*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
         a[left]，那么就是给key）*/
        arr[i] = arr[j];
        
        while (i<j && key >= arr[i]) {
            /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
             因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
            i++;
        }
        arr[j] = arr[i]; //因为arr[i]比arr[j]大, 大的排到右半边
        
        /*当在当组内找完一遍以后就把中间数key回归*/
        arr[i] = key; //key就相当于中介值
        
        /*最后用同样的方式对分出来的左边的小组进行同上的做法*/
        quickSort(arr, i+1, right);
        
        /*用同样的方式对分出来的右边的小组进行同上的做法*/
        quickSort(arr, left, i-1);
        
        /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
    }
}

int binarySearch(int arr[],int length,int key){
    
    int low = 0;
    int high = length - 1;
    int mid ;
    
    while (low <= high) {
        mid = (low + high)/2;
        if (arr[mid]==key) {
            return mid;
        }else if (arr[mid]<key ){
            low = mid+1;
        }else{
            high = mid-1;
        }
    }
    return -1;
}

//冒泡排序
void bubbleSort(int arr[],int length){
    
    for (int i = 0; i < length; ++i) {
        for (int j = i; j < length; ++j) {
            
            if (arr[i]<arr[j]) {
                int tem = arr[i];
                arr[i]=arr[j];
                arr[j] = tem;
            }
            
        }
    }
    
}

