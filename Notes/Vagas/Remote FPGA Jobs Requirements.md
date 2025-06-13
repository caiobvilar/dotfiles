# Remote FPGA Jobs Requirements

- Bachelor’s degree in computer science, electrical engineering, or related field;
- 6+ years of developing RTL designs using Verilog and SystemVerilog for complex digital systems;
- 2+ years of experience with C++ programming, preferably in embedded systems;
- Proficiency in RTL simulation and verification methodologies; has experience utilizing Verilator;
- Strong debugging skills for both software and hardware;
- Experience with FPGA constraint setup, static timing analysis, and optimizing FPGA builds;
- Proficiency with Linux-based design environments;
- Design experience with FPGA-based SoCs;
- Knowledge of Ethernet or packet-based networking designs for FPGA or ASIC implementations, with a deep understanding of Ethernet and IP packet processing;
- Experience with video FPGA designs and video baseband interfaces such as SDI and HDMI;
- Domain knowledge in Pro-AV/Broadcast or Imaging solutions is a strong plus;
- There's not much point learning to design a soft CPU core unless you want a job at Arm/Intel/Xilinx or similar - no one else bothers to design them, they just drop one in. Sure it's still a decently difficult project that demonstrates you understand the tools, but you might be better off doing something aligned with the employers around you.

If it's military, you want DSP and encryption.

Financial is all about communications and low latency.

If you have a diverse pool of employers, then picking something you're interested in is the key to success. Bitcoin, audio, video, networking, radio, games... think about something you want to build!
Something that uses high speed interfaces (SERDES, SDRAM, DDR...), reasonably high clock freq (>100 MHz, better if it's pushing hardware limits so you can have some experience in timing closure), multiple clock domains.

Try using as many interfaces on your board in one project as possible (if you have display output do some basic video controller, if you have ethernet connector make it communicate with PC over some simple protocol like UDP, if you have ADC/DAC use these as well, etc...).

For the sake of landing an entry-level FPGA position, something that interfaces the real world over a standard (or well documented) interface is a decent project. Interfacing things off-chip is where you can run into all kinds of analog-domain issues (clock skew, noise, etc) and metastability.

UART is a great start: it's standard, asynchronous, and ubiquitous.

Try implementing something like UART but running your design very close to the serial rate. That is a decent representation of implementing higher speed interfaces without needing to worry about the EE side of things.

If you want a little more challenge, then ramp up the speed for real and do UART at 20, 50, or 100Mbaud. This will start to cross into the EE/analog side a bit as you ramp up the speed.

Actually doing some real work inside the FPGA is also important. DSP is good for that and lets you show off some domain knowledge. DSP is often a great way to demonstrate that you understand pipelining. For added difficulty, try adding multirate processing or an algorithm with a variable number of steps.

If you already have UART, you can build a simple serial protocol and API on top of that. Try defining a protocol that operates on variable length packets with checksums, for example. Some checksums, like parity or ECC, can cause long combo paths so you can demonstrate timing closure on a difficult path.

Try running your work logic at a different click rate than your interface so you can demonstrate crossing clock domains in both directions (slow-to-fast and fast-to-slow). Be sure to cover a few common scenarios (flags/pulses, edges, buses). I'd suggest having 2 implementations for each: your academic one where you implement everything on your own (to show understanding) and your practical/engineering implantation using standard blocks (to show what you would do on a real job).

Working with external DRAM is another great project. DRAM can have very long and highly variable latency that you must deal with in your design. The memory controllers are complex IP and getting then configured and interfacing then correctly can be a challenge.

I would expect a fresh grad to at least be familiar enough with their fundamentals to be able to discuss (e.g. in an interview) why potential difficulties and design trades involved with these.

I would be impressed by a fresh-grad had a portfolio that included one or two of these that they could present, demonstrate, and discuss about in depth.

If you had a portfolio project that did most or all of these, then we probably wouldn't be talking about entry-level anymore