% Create a function that computes the Value-at-Risk of a portfolio

% 1. Read portfolio values
indices=csvread('edhec-hedgefundindices.csv',1,1);
% indices=readmatrix('edhec-hedgefundindices.csv');

%allow us to preview data
%opts = detectImportOptions('edhec-hedgefundindices.csv');
%preview('edhec-hedgefundindices.csv',opts)

% 2. Compute monthly returns
ret= indices(2:end,:)./indices(1:end-1,:)-1;
ret(isinf(ret))=0; %since matrix comp above returns "inf" for "n/a" return values (e.g. div 0)

% 3. Get the alpha%, Input tool
alpha_0=inputdlg("Desired VaR Confidence Level(%)");
alpha=str2double(alpha_0);

%later on, add VaR method as an option

% 4. Create VaR comp

var=prctile(ret,100-alpha);
