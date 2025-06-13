# Week 3 - Audio Classification

## Sample Rate and Bit Depth

While optional, we encourage you to take a look at the following articles to learn more about the topics covered in this lesson:

Video showing how speakers work: [https://www.youtube.com/watch?v=048tBZMt3eY](https://www.youtube.com/watch?v=048tBZMt3eY)

Video that covers the common audio sample rates: [https://www.youtube.com/watch?v=fZzMXdxbOes](https://www.youtube.com/watch?v=fZzMXdxbOes)


* [Digital Audio Basics: Sample Rate and Bit Depth](https://www.izotope.com/en/learn/digital-audio-basics-sample-rate-and-bit-depth.html)
* [Data Augmentation | How to use Deep Learning when you have Limited Data — Part 2](https://nanonets.com/blog/data-augmentation-how-to-use-deep-learning-when-you-have-limited-data-part-2/)
* [Make the most of limited datasets using audio data augmentation](https://www.edgeimpulse.com/blog/make-the-most-of-limited-datasets-using-audio-data-augmentation)

## Nyquist-Shannon Sampling Theorem

In order to fully capture all of the detail in a signal, meaning we could reconstruct the original continuous time signal, we must sample at a frequency greater than two times the highest frequency component in that signal.

$f_s > 2B$
$f_s$ is the sampling frequency (Hz)
$B$ is the highest frequency component (Hz)

**LESSON**: make sure that what you're recording is less than half the sampling frequency!

## MFCCs and CNNs

While optional, we encourage you to take a look at the following articles to learn more about the topics covered in this lesson:

* Video that explains the Fourier Transform: [https://www.youtube.com/watch?v=spUNpyF58BY](https://www.youtube.com/watch?v=spUNpyF58BY)
* [The Nyquist–Shannon Theorem: Understanding Sampled Systems](https://www.allaboutcircuits.com/technical-articles/nyquist-shannon-theorem-understanding-sampled-systems/)
* [Sampling Theorem and Frequency Spectrum Aliasing](https://lspo.feri.um.si/CoLoS/applets/aliasing/index.html)
* [Mel Frequency Cepstral Coefficient (MFCC) tutorial](http://practicalcryptography.com/miscellaneous/machine-learning/guide-mel-frequency-cepstral-coefficients-mfccs/)
* [Speech Processing for Machine Learning: Filter banks, Mel-Frequency Cepstral Coefficients (MFCCs) and What's In-Between](https://haythamfayek.com/2016/04/21/speech-processing-for-machine-learning.html)
* [A Comprehensive Guide to Convolutional Neural Networks — the ELI5 way](https://towardsdatascience.com/a-comprehensive-guide-to-convolutional-neural-networks-the-eli5-way-3bd2b1164a53)
* [Convolutional Neural Networks (CNN): Step 1(b) - ReLU Layer](https://www.superdatascience.com/blogs/convolutional-neural-networks-cnn-step-1b-relu-layer/)
* [1D Convolutional Neural Networks and Applications – A Survey](https://arxiv.org/ftp/arxiv/papers/1905/1905.03554.pdf)
* [A Gentle Introduction to Dropout for Regularizing Deep Neural Networks](https://machinelearningmastery.com/dropout-for-regularizing-deep-neural-networks/)
* [How to Configure the Learning Rate When Training Deep Learning Neural Networks](https://machinelearningmastery.com/learning-rate-for-deep-learning-neural-networks/)

 ## Implementation Strategies and Sensor Fusion
 
 While optional, we encourage you to take a look at the following articles to learn more about the topics covered in this lesson:
 
 * [Moving Average](https://en.wikipedia.org/wiki/Moving_average)
 * [Sensor Fusion](https://towardsdatascience.com/sensor-fusion-90135614fde6)
 
 