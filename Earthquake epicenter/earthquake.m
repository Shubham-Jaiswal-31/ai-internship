% This code loads the earthquake data.
% load after_filtering

[p,f,t] = pspectrum(wanc_bandpass,50,"spectrogram");

psum = sum(p);
plot(t,psum)

pwr = db(psum,"power");
plot(t,pwr)

% Find local maxima
maxIndices = islocalmax(pwr,"MinProminence",10,"SamplePoints",t);

% Display results
figure
plot(t,pwr,"SeriesIndex",6,"DisplayName","Input data")
hold on

% Plot local maxima
scatter(t(maxIndices),pwr(maxIndices),"^","filled","SeriesIndex",2, ...
    "DisplayName","Local maxima")
title("Number of extrema: " + nnz(maxIndices))
hold off
legend
xlabel("t")


quakeSec = t(maxIndices)