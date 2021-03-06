function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h = sigmoid(X*theta);
term_1 = -y .* log(h);
term_2 = -(1 - y) .* log(1 - h);
theta_j = theta(2:end);
term_reg = (lambda/(2*m))*sum(theta_j.^2);
J = (1/m)*sum(term_1 + term_2) + term_reg;
grad_reg = (lambda/m) * theta_j;
grad_reg_padded = [0 ; grad_reg];
grad_old = (1/m)*(X' * (h -y));
grad = grad_old  + grad_reg_padded;





% =============================================================

end
