# YOLOV8-MEDICAL-IMAGING 🤖🩺

## Introduction
This project serves as our Computer Vision semester project for the 6th semester of BS Artificial Intelligence at Bahria University Islamabad Campus. The project focuses on applying YOLOv8 for detecting and segmenting medical anomalies in imaging data, such as X-rays, CT scans, and ultrasound images. The goal is to provide a scalable and efficient solution for accurate medical diagnoses using advanced object detection and segmentation techniques.

## Table of Contents
- [Introduction](#introduction)
- [Program](#program)
- [University](#university)
- [Instructor](#instructor)
- [Implementation Details](#implementation-details)
  - [Dataset](#dataset)
  - [Data Preprocessing](#data-preprocessing)
  - [Model Architecture](#model-architecture)
  - [Workflow](#workflow)
- [Tools and Libraries](#tools-and-libraries)
- [Group Members](#group-members)

## Program
📘 BSAI - 6TH SEMESTER
## University
🏫 Bahria University Islamabad Campus

## Instructor
🎓 Mam Samia Kiran

## Implementation Details

### Dataset
🗂️ The project uses publicly available medical imaging datasets, including:
- COVID-19 Image Dataset (https://www.kaggle.com/datasets/pranavraikokte/covid19-image-dataset)
- RBC and WBC Blood Cells Detection Dataset (https://universe.roboflow.com/tfg-2nmge/yolo-yejbs)
- Breast Ultrasound Images Dataset (https://www.kaggle.com/datasets/aryashah2k/breast-ultrasound-images-dataset)

### Data Preprocessing
🧹 The preprocessing steps include:
- Rescaling images to standard dimensions.
- Normalization for consistent pixel intensity.
- Data augmentation techniques such as:
  - Rotation
  - Flipping
  - Contrast adjustment

### Model Architecture
🧠 YOLOv8 was chosen for its efficiency in real-time object detection and segmentation. The model was fine-tuned on the medical datasets to identify and segment anomalies like tumors, infections, and blood cells.

### Workflow
1. **Input Image:** A raw medical image (e.g., X-ray, CT scan).
2. **Preprocessing:** Normalize and augment image data.
3. **Detection:** YOLOv8 identifies regions of interest (ROIs).
4. **Segmentation:** Accurate boundary delineation of detected anomalies.
5. **Output:** Annotated image and associated metrics (confidence scores).

## Tools and Libraries
🛠️ This project utilizes:
- **Frameworks:** PyTorch, TensorFlow
- **Object Detection:** YOLOv8
- **Image Processing:** OpenCV, PIL

## Group Members
👥
- **Muhammad Taqui**
- **Babar Ali**
- **Hermen Khan** 
