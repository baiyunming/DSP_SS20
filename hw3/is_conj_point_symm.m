function conj_point_symm = is_conj_point_symm(imf)
% Input argument: imf - frequency transform of an image
% Output argument: conj_point_symm - true if conjugate point-symmetry holds for this image,
% and false otherwise


% Use fftshift to have the zero frequency component in the center of the spectrum
shifted_frequency = fftshift(imf);


% Copy the first row/col for to the end+1^th row/col
shifted_frequency(end+1,:) =  shifted_frequency(1,:);
shifted_frequency(:,end+1) =  shifted_frequency(:,1);



% Get upper & lower matrix, check point-symmetry:
upper_matrix = shifted_frequency(1:ceil(0.5*size(shifted_frequency,2)),:);
lower_matrix = shifted_frequency(ceil(0.5*size(shifted_frequency,2)):end,:);
result_matrix = (upper_matrix == conj(rot90(lower_matrix,2)));
conj_point_symm =  any(result_matrix,'all');


end