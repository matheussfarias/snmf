function X = quantization(X,b); 
low = min(X(:));
x_shifted = X-low;
high = max(x_shifted(:));
x_shifted_scaled = x_shifted*(2^b -1)/high;
x_floor = int32(floor(x_shifted_scaled +.5));
x_back = single(x_floor)*high/(2^b -1);
X = x_back + low;
end