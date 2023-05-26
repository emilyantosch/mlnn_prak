function [w, track] = gaEinfach(gradFunc, eta, w0, nIts)
    %GAEINFACH Sehr einfache Version des Gradientenabstiegs 
    w = w0; 
    track = zeros(length(w0),nIts);
    for n = 1:nIts
        w = w - eta * gradFunc(w);
        track(:,n) = w; 
    end
end

H = 100;
lambda = 0;
options = trainingOptions('rmsprop',...
   'ValidationData', {normTrainMat, adsTrain.Labels}, ...
   'MaxEpochs', 1000, ...
   'MinibatchSize', 64, ...
   'L2Regularization', lambda, ...
   'Verbose', true, ...
   'Plots', 'none'); % training-progress'); 

layers = [featureInputLayer(P)
   fullyConnectedLayer(H)
   reluLayer
   fullyConnectedLayer(H)
   reluLayer
   fullyConnectedLayer(C)
   softmaxLayer
   classificationLayer];
tic
net = trainNetwork(normTrainMat, adsTrain.Labels, layers, options);
toc