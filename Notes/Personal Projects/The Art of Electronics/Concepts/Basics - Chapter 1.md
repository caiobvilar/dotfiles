# Basics - Chapter 1

## Resistors in Series and Parallel
1. The resistance equation:
$$R = \frac{V}{I}$$
2. The resistance of two resistors in series:
$$R = R_1+R_2$$
3. The resistance of two resistors in parallel:
$$R = \frac{R_1*R_2}{R_1+R_2}$$
or
$$R = \frac{1}{\frac{1}{R_1}+\frac{1}{R_2}}$$

## Voltage Divider
$$\frac{V_{out}}{V_{in}} = \frac{R_2}{R_1+R_2}$$
or
$$V_{out} = \frac{R_2}{R_1+R_2}*V_{in}$$
- Output voltage is always less than or equal to the input voltage

## Signals
### Sinusoidal Signals
A sinewave voltage is described by
$$V = A \sin(2*\pi *f*t)$$
or
$$V = A \sin(2*\pi *f*t + \phi)$$
or
$$V = A \sin(\omega*t)$$
where 
$$\omega \text{ is the angular frequency measured in radians per second.}$$
- A is the amplitude in Volts.
 - Remember the important relation of
$$\omega = 2*\pi*f$$

### Signal Amplitudes and Decibels

$$V_{pp} = \text{peak to peak amplitude} = 2 A$$

$$V_{rms} = \text{root-mean-squared amplitude} = \frac{1}{\sqrt{2}A} = 0.707 A$$

#### Decibels
How do you compare the relative amplitudes of two signals? You could say, for instance, that signal X is twice as large as signal Y . That’s ﬁne, and useful for many purposes. But because we often deal with ratios as large as a million, it is better to use a logarithmic measure, and for
this we present the decibel (it’s one-tenth as large as something called a bel, which no one ever uses). By deﬁnition,the ratio of two signals, in decibels (dB), is
$$dB = 10\log_{10}\frac{P_1}{P_2}$$
where
$$P_1 and $$