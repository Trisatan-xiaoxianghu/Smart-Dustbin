function image_shot(is_shot,directory,obj)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
persistent i
if isempty(i)
   i = 1; 
end
if is_shot
    date_string=datestr(date,29);%��ȡϵͳʱ��
    filename=[date_string,'-',num2str(i)];%�����ƶ���ʽͼƬ����2015-05-12-1.2.3.....(��ţ�
    frame = getsnapshot(obj);%ץͼ
    imwrite(frame,[directory,filename,'.jpg']);%��ͼ'
    i=i+1;
else
    clear i;%����ֲ�����
    delete(obj);%�ر�����ͷ
end

end