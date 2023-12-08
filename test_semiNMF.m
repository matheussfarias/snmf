% Tests
clear all; clc; 
m = 128; 
n = 512; 
r = 64; 
b = 4;
runs = 100;

err_b = zeros(runs, 1);
err_svd = zeros(runs, 1);
err_smf32 = zeros(runs, 1);
err_smf16 = zeros(runs, 1);
err_smf8 = zeros(runs, 1);
err_smf6 = zeros(runs, 1);
err_smf4 = zeros(runs, 1);

for i = 1 : runs
        X = rand(m,n); 

        X_b = quantization(X,8);
        [u,s,v] = svds(X,r); 
        [W,H,e] = semiNMF(X,r);
        W_16 = quantization(W,16);
        H_16 = quantization(H,16);
        W_8 = quantization(W,8);
        H_8 = quantization(H,8);
        W_6 = quantization(W,6);
        H_6 = quantization(H,6);
        W_4 = quantization(W,4);
        H_4 = quantization(H,4);
        
        err_b(i)=norm(X-X_b,'fro');
        err_svd(i)=norm(X-u*s*v','fro');
        err_smf32(i)=norm(X-W*H,'fro');
        err_smf16(i)=norm(X-W_16*H_16,'fro');
        err_smf8(i)=norm(X-W_8*H_8,'fro');
        err_smf6(i)=norm(X-W_6*H_6,'fro');
        err_smf4(i)=norm(X-W_4*H_4,'fro');
end

% 0) Only Quantization b bits
disp('**** Test Quantization on a gaussian matrix****'); 
fprintf('Error ||X-WH||_F of SVD = %2.2f.\n',...
                   mean(err_b)); 

% 1) SVD
disp('**** Test SVD on a gaussian matrix****'); 
fprintf('Error ||X-WH||_F= %2.2f.\n',...
                   mean(err_svd)); 
fprintf('std ||X-WH||_F= %2.2f.\n',...
                   std(err_svd)); 


% 2) Semi-NMF with full precision (float32)
disp('**** Test semi-NMF on a gaussian matrix****'); 
fprintf('Error ||X-WH||_F = %2.2f',...
                   mean(err_smf32)); 
fprintf('std ||X-WH||_F = %2.2f',...
                   std(err_smf32)); 

% 3) Semi-NMF with Quantization (16-bits)
disp('**** Test semi-NMF on a quantized gaussian matrix 16-bits ****');
fprintf('Error ||X-WH||_F  = %2.2f.\n',...
                   mean(err_smf16)); 
fprintf('std ||X-WH||_F  = %2.2f.\n',...
                   std(err_smf16)); 

% 4) Semi-NMF with Quantization (6-bits)
disp('**** Test semi-NMF on a quantized gaussian matrix 6-bits ****');
fprintf('Error ||X-WH||_F= %2.2f.\n',...
                   mean(err_smf6)); 
fprintf('std ||X-WH||_F= %2.2f.\n',...
                   std(err_smf6)); 

% 4) Semi-NMF with Quantization (8-bits)
disp('**** Test semi-NMF on a quantized gaussian matrix 8-bits ****');
fprintf('Error ||X-WH||_F= %2.2f.\n',...
                   mean(err_smf8)); 
fprintf('std ||X-WH||_F= %2.2f.\n',...
                   std(err_smf8)); 

% 5) Semi-NMF with Quantization (4-bits)
disp('**** Test semi-NMF on a quantized gaussian matrix 4-bits ****');
fprintf('Error ||X-WH||_F= %2.2f.\n',...
                   mean(err_smf4)); 
fprintf('std ||X-WH||_F= %2.2f.\n',...
                   std(err_smf4)); 

r_m = (1 - r*(2*m + n)/(2*m*n))*100;
r_p = (1-r*(m+n)/(2*m*n))*100;

% R_m and R_p
disp('**** Savings on number of memristors and parameters ****');
fprintf('R_m for r= %2.2f.\n is %2.2f.\n',...
                   r_m, r); 
fprintf('R_p for r= %2.2f.\n is %2.2f.\n',...
                   r_p, r);
%Plots
%Error plot
figure
boxplot([err_svd,err_smf32,err_smf16,err_smf8,err_smf6,err_smf4],'Labels',{'SVD', 'Semi-NMF32', 'Semi-NMF16', 'Semi-NMF8', 'Semi-NMF6', 'Semi-NMF4'})
ax = gca;
ax.YAxis.Scale ="log";
ax.YLim = [0.9, 1e3 + 10]
xlabel('Factorization Method')
ylabel('Frobenius Norm Error')

%Area saving plot
figure
bar([16, 32, 64, 128], [90.62, 81.25, 62.50, 25.00])
xlabel('k')
ylabel('R_m')

%Parameter saving plot
figure
bar([16, 32, 64, 128], [92.19, 84.38, 68.75, 37.50])
xlabel('k')
ylabel('R_m')