function vel = velocity(x);

%load parameters:
load pars.mat
%assign parameters;
mu1 = pars(1);
q1 = pars(2);
mu2 = pars(3);
q2 = pars(4);
e2 = pars(5);
a0 = pars(6);

u = x(1);
v = x(2);
w = x(3);
q = x(4);

vel = [2*mu1*u + q1*q; 
	   2*mu2*v + (q2/2)*q;
	   mu2*w + 2*mu1*w - e2*q - a0*q2*q + 2*a0*q1*q;
	   e2*w + mu2*q + mu1 *2*q + q2*u^2 + q2*a0*w - q1*a0*w - 4*q1*u*v];
