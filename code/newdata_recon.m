
% generate label map with trained model

datadir = 'D:\Documents\Yu\40 LPBA\image';
% datadir  = 'D:\Documents\Yu\label_unlabel'; % Edit accordingly
files1    = spm_select('FPList',datadir,'^wc1.*\.nii$');
F1 = nifti(files1);
files2    = spm_select('FPList',datadir,'^wc2.*\.nii$');
F2 = nifti(files2);


tic




for i=1:40
F=cat(4,F1(i).dat,F2(i).dat);  
[Y,~]=PatchCCAapply(model,F,sett); % Y is label map and P is prob
label_tr{i}=Y;
end

% files3= spm_select('FPList',datadir,'^w.*glm\.nii$');
% Nii=nifti(files3);
% Nii_1=Nii(1:10);
% 
% 
% for j=1:10
%     Z=label_tr{j};
%     score_tr{j}=ssim(double(Z(:,:,50)'), Nii_1(j).dat(:,:,50)');
% end
% 
% tr_mean=mean([score_tr{:}]);
    

toc