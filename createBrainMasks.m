hdr = spm_vol('segmentation_renumbered.nii');
d = spm_read_vols(hdr);


% create parietal mask
% Parietal = 18, 22, 23

hdr_new = hdr; hdr_new.fname = 'ParietalMask.nii';
d_vec = d(:);
newD = zeros(length(d_vec), 1);
newD(find(d_vec==18)) = 1; newD(find(d_vec==22)) = 1; newD(find(d_vec==23)) = 1;
newD = reshape(newD, size(d));
spm_write_vol(hdr_new, newD)

% M1/M2 = 19, 20
hdr_new = hdr; hdr_new.fname = 'MotorMask.nii';
d_vec = d(:);
newD = zeros(length(d_vec), 1);
newD(find(d_vec==19)) = 1; newD(find(d_vec==20)) = 1;
newD = reshape(newD, size(d));
spm_write_vol(hdr_new, newD);


hdr_new = hdr; hdr_new.fname = 'VisualMask.nii';
d_vec = d(:);
newD = zeros(length(d_vec), 1);
newD(find(d_vec==35)) = 1; newD(find(d_vec==36)) = 1;
newD(find(d_vec==37)) = 1; newD(find(d_vec==38)) = 1;
newD(find(d_vec==39)) = 1; newD(find(d_vec==40)) = 1;
newD = reshape(newD, size(d));
spm_write_vol(hdr_new, newD);


hdr_new = hdr; hdr_new.fname = 'SomatosensoryMask.nii';
d_vec = d(:);
newD = zeros(length(d_vec), 1);
newD(find(d_vec==24)) = 1; newD(find(d_vec==25)) = 1;
newD(find(d_vec==26)) = 1; newD(find(d_vec==27)) = 1;
newD(find(d_vec==28)) = 1; newD(find(d_vec==29)) = 1;
newD(find(d_vec==30)) = 1; newD(find(d_vec==31)) = 1;
newD(find(d_vec==32)) = 1; newD(find(d_vec==33)) = 1;
newD = reshape(newD, size(d));
spm_write_vol(hdr_new, newD);
