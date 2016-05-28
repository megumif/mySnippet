% create AAL ROI Mask for FSL DTI

maskFile = 'path2img';
newMask_fNameBody = 'AALROIs_';

% read the AAL mask image
s_Mask = spm_vol(maskFile);
d_Mask = spm_read_vols(s_Mask);

% obtain ROI ID
roiIDList = unique(d_Mask(:));
roiIDList(find(roiIDList==0)) = []; %remove zero

% obtain ROI name
a =fopen('ROI_MNI_V5.txt');
b = textscan(a, '%s %s %s %s');
ROINameList = b{1};
% create&save the image(s)

for idx = 1:length(roiIDList)
    s_NewMask = s_Mask; s_NewMask.fname = [newMask_fNameBody ...
        char(ROINameList(idx, :)) '_' num2str(roiIDList(idx)) '.nii'];
    evalStr = ['i1 == ' num2str(roiIDList(idx))];
    spm_imcalc(s_Mask, s_NewMask, evalStr)
end
