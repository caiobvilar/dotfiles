# Introduction to Embedded Machine Learning -  Syllabus
Please note that a large amount of foundational math goes into training neural networks and using them for inference. This course does not assume a background in such knowledge, and as such, it is meant as an introductory course in applying machine learning (using various tools and libraries) in embedded systems without needing to understand the finer details of neural networks (and other machine learning algorithms).

We will broadly cover the listed topics to get feel for how machine learning is used rather than spend time deeply covering the math behind it. The hope is to get you familiar enough with machine learning to start using and playing with it. We also hope to give you a starting vocabulary so that you know what to search for when you get stuck or give you some inspiration on new areas to dive deeper into.

There are other courses, books, and videos available that dive deep into the math behind machine learning. This course is an introduction to using some modern tools to get machine learning (specifically, neural networks) running on embedded devices, such as microcontrollers.

## Prerequisites

You should be familiar with the following areas before starting this course:
* Algebra (you should know how to "solve for x" in mathematical equations)
* Arduino (if you plan to use the Arduino board for the demos and projects)

Please note that several advanced topics are discussed in the course, such as backpropagation, Fourier transform, filtering, etc. It helps if you are familiar with these topics, but they are not necessary for completing the course. They are mentioned to explain how things work and to give you some vocabulary if you wish to dive deeper into a particular subject area. However, quizzes and tests will not assume you have knowledge of these advanced areas.

## Syllabus

Here is a broad outline of the topics that will be covered in the course:
* What is machine learning (ML)?
* Limitations of ML
* Ethics of ML
* ML on embedded devices
* What makes something a hardware accelerator for ML?
* How can software frameworks help optimize ML?
* Using the Edge Impulse tool for embedded ML
* Data collection
* Feature extraction and selection
* ML pipeline
* Overview of neural networks
* Neural network training
* Model evaluation
* Underfitting and overfitting
* Anomaly detection
* Deploying a neural network to an embedded device
* Audio and speech classification
* Convolutional neural networks
* Sensor fusion

## Errata and Changes

Since the launch of this course, Edge Impulse has made a few updates to its interface. As a result, some of the screenshots and videos may not accurately reflect what you see in the Edge Impulse Studio. In particular:

* There is a new version of the **Spectral Analysis** block, now called **Spectral Features**. The **FFT** and power spectrum are still calculated and used as feature inputs to the learning block. However, some of the parameters have been removed or renamed to make the block easier to use. Feel free to read about the new Spectral Features block here: [**https://docs.edgeimpulse.com/docs/edge-impulse-studio/processing-blocks/spectral-features**](https://docs.edgeimpulse.com/docs/edge-impulse-studio/processing-blocks/spectral-features)
* In the lectures, you will notice that the data explorer (after extracting features) is shown on a 3D plot. Edge Impulse has changed the data explorer to use a different dimensionality reduction algorithm, which now **maps features to a 2D map**. The effect is the same, however: it allows you to estimate the separation among your classes.
* The **Neural Network** (Keras) learning block has been renamed to **Classification**. The block is the same, but just the name has changed.