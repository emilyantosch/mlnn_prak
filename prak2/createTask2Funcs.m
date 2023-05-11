function [func, gradFunc] = createTask2Funcs(t,y)

% Create a handle to the MSE function
    function MSE = funcImpl(w)
        z = w(1).*(1-exp(-t/w(2)));
        Delta = (z-y);
        MSE = mean(Delta.^2);
    end
func = @funcImpl;

% Create a handle to the MSE gradient function
    function MSEGrad = gradFuncImpl(w)
        z = w(1).*(1-exp(-t/w(2)));
        Delta = (z-y);
        dzdw1 = (1-exp(-t/w(2)));
        dzdw2 = -1.*(w(1)/w(2).^2).*t.*exp(-t/w(2));
        
        MSEGrad = [mean(Delta.*dzdw1); mean(Delta.*dzdw2)];
    end
gradFunc = @gradFuncImpl;
end