function klaster = DBSCAN(udaljenost,Eps,MinPts)
klaster=zeros(size(udaljenost,1),1)-1;
klasterId=1;
tacke=randperm(length(klaster));
for i=1:length(klaster)
    pt=tacke(i);
    if klaster(pt)==-1
        [klaster,isnoise]=ExpandCluster(udaljenost,pt,klasterId,Eps,MinPts,klaster);
        if ~isnoise
            klasterId=klasterId+1;
        end
    end
end
end
function [klaster,isnoise]=ExpandCluster(DistMat,pt,klasterId,Eps,MinPts,klaster)
seeds=find(DistMat(:,pt)<=Eps);
if length(seeds)<MinPts
    klaster(pt)=0; 
    isnoise=true;
    return
else
    klaster(seeds)=klasterId;
    seeds=setxor(seeds,pt);
    while ~isempty(seeds)
        trenutna=seeds(1);
        rezultat=find(DistMat(:,trenutna)<=Eps);
        if length(rezultat)>=MinPts
            for i=1:length(rezultat)
                rezultat_trenutni=rezultat(i);
                if klaster(rezultat_trenutni)==-1||klaster(rezultat_trenutni)==0
                    if klaster(rezultat_trenutni)==-1
                        seeds=[seeds(:);rezultat_trenutni];
                    end
                    klaster(rezultat_trenutni)=klasterId;
                end
                
            end
        end
        seeds=setxor(seeds,trenutna);
    end
    isnoise=false;
    return 
end
end
