function [E_prop] = elem_properties(N,E)
    E_prop = zeros(size(E,1),3); % <Length, cosine, sine>
    elem_dim = size(N,2);
    
    switch elem_dim
        case 1 % 1D truss
            E_prop = zeros(size(E,1),1); % <Length>
            for i = 1:size(E,1)
                n1 = N(E(i,2),:);
                n2 = N(E(i,3),:);
                E_prop(i,1) = abs(n2(1) - n1(1)); % length
            end
        case 2 % 2D truss
            E_prop = zeros(size(E,1),3); % <Length, cosine, sine>
            for i = 1:size(E,1)
                n1 = N(E(i,2),:);
                n2 = N(E(i,3),:);
                E_prop(i,1) = sqrt((n2(1)-n1(1))^2 + (n2(2)-n1(2))^2); % length
                E_prop(i,2) = (n2(1) - n1(1))/E_prop(i,1); % cosine
                E_prop(i,3) = (n2(2) - n1(2))/E_prop(i,1); % sine
            end
    end
end