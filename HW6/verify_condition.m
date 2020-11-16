a0 = 1/2; b0 = 1/4; c0 = 1/4; % F0 = 0.5+0.25*(z^-1 + z);
a1 = 1/2; b1 = -1/4; c1 = -1/4; % F1 = 0.5-0.25*(z^-1 + z);
pr_rec = verify_condition(a0,b0,c0,a1,b1,c1);


function pr_rec = verify_condition(a0,b0,c0,a1,b1,c1)
    % input arguments: a0,b0,c0 - coefficients for analysis filter F0(z)
    % a1,b1,c1 - coefficients for analysis filter F1(z)
    % output argument: true if conditions are satisfied, false otherwise
    syms z
    % define here F0,F1 in terms of z
    F0pos = a0 + b0*z^-1 + c0*z;
    F1pos = a1 + b1*z^-1 + c1*z;
    F0neg = a0 - b0*z^-1 - c0*z;
    F1neg = a1 - b1*z^-1 - c1*z;
    
    detF = F0pos * F1neg - F0neg *F1pos;
    
    G0 = 2*F1neg/detF;
    G1 = -2*F0neg/detF;
    
    condition1 = F0pos*G0 + F1pos*G1; 
    condition2 = F0neg*G0 + F1neg*G1; 
    cond1 = (double(simplify(condition1))==2); % implement conditions for perfect reconstruction here
    cond2 = (double(simplify(condition2))==0);  
    pr_rec = cond1 && cond2;

end