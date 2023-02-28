function [K_g] = assembleStiffness(N, E, E_prop)
    num_elem = size(E,1);
    num_node = size(N,1);
    elem_type = mean(E(:,1)); % element type is also DOF for that element

    K_g = zeros(elem_type*num_node); % initializing the global stiffness matrix

    % loop over every element
    for i = 1:num_elem
        stiff_axial = 0; % clearing any exising

        stiff_axial = E(i,4)*E(i,5)/E_prop(i,1); % Area * Young's modulus / L

%         K_g = ???;
     
    end
end