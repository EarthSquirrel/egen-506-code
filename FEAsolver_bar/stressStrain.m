function [sig, eps] = stressStrain(N, E, U, F, E_prop)
% [sig, eps] = stressStrain(N, E, U, F, E_prop) solves for the strains and
% stresses of 1D bar elements

    sig = zeros(size(E,1),1); % initialize stress
    eps = sig; % and strain

    % loop over each element to solve for the element strain
    for i = 1:size(E,1) 
%         ???;
        
        L_inv = 1/E_prop(i,1); % calculate the inverse of the element length
%         eps(i) = ???;
    end
%     sig = eps.*E(:,5); % using the strain, solve for the stress... assuming the Young's modulus is in column 5 of the element array
end