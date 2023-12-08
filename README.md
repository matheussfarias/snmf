# Semi-Nonnegative Matrix Factorization for Crossbars: Using Fewer Memristors on DNNs

We propose a semi-nonnegative matrix factorization (Semi-NMF) for mapping deep neural network (DNN) weights into resistive compute-in-memory crossbars. There is no device with negative resistance. Thus, we require at least two crossbars to represent a single DNN weight matrix -- one for nonpositive and the other for nonnegative values. With Semi-NMF, we only double the mixed-sign crossbar, which is chosen to be the smallest. This reduces memristor count, greatly decreasing area with a potential DNN accuracy increase.

The method is evaluated on gaussian matrices that mimetizes DNN weight matrices. We achieved up to PH of area reduction with PH of accuracy loss with respect to the singular value decomposition, respectively. This novel weight allocation algorithm promote area-efficient crossbars for DNNs.


## How to use the code
First run `Install.m` to define the path with all useful code.

Then, the main code is `test_semiNMF.m`, where we can find all the results of the final report.

**Matheus Farias**