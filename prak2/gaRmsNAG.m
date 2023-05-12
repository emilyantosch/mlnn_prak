function [w, track] = gaRmsNAG(gradFunc, eta, w0, nIts, gamma, beta)
    % Gradient descent with Nesterov's accelerated gradient and RMSprop
    % gradFunc: function handle for gradient
    % eta: learning rate
    % w0: initial weight vector
    % nIts: number of iterations
    % gamma: momentum parameter
    % beta: RMSprop parameter
    % w: final weight vector
    % track: tracks the value of the objective function over iterations

    % Initialize
    w = w0;
    clip = 0.5;
    track = zeros(length(w0), nIts);
    v = zeros(size(w0));
    lambda = 1e-8;
    s = zeros(size(w0));
    % Iterate over the number of iterations and update the weight vector
    for ii = 1:nIts
        g = gradFunc(w);

        ng = norm(g)

        if ng > clip
            g = clip/ng * g;
        end
       g
       s = beta * s + (1-beta)* g.* g;
       
       etaVec = eta ./ sqrt(s+lambda);

       v = gamma + v - etaVec * gradFunc(w+gamma*v);
       w = w + v;

        track(:, ii) = w;
    end
end