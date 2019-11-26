package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.icia.domain.Criteria;
import kr.icia.domain.ProductsVO;
import kr.icia.mapper.BrandMapper;

@Service
public class BrandServiceImplements implements BrandService {

	@Inject
	private BrandMapper mapper;

	@Override
	public List<ProductsVO> getAukeyList(Criteria cri) throws Exception {
		return mapper.getAukeyListWithPaging(cri);
	}

	@Override
	public int getAukeyTotal(Criteria cri) throws Exception {
		return mapper.getAukeyTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getBeatsByDrDreList(Criteria cri) throws Exception {
		return mapper.getBeatsByDrDreListWithPaging(cri);
	}

	@Override
	public int getBeatsByDrDreTotal(Criteria cri) throws Exception {
		return mapper.getBeatsByDrDreTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getBoseList(Criteria cri) throws Exception {
		return mapper.getBoseListWithPaging(cri);
	}

	@Override
	public int getBoseTotal(Criteria cri) throws Exception {
		return mapper.getBoseTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getBritzList(Criteria cri) throws Exception {
		return mapper.getBritzListWithPaging(cri);
	}

	@Override
	public int getBritzTotal(Criteria cri) throws Exception {
		return mapper.getBritzTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getEtymoticList(Criteria cri) throws Exception {
		return mapper.getEtymoticListWithPaging(cri);
	}

	@Override
	public int getEtymoticTotal(Criteria cri) throws Exception {
		return mapper.getEtymoticTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getGoGrooveList(Criteria cri) throws Exception {
		return mapper.getGoGrooveListWithPaging(cri);
	}

	@Override
	public int getGoGrooveTotal(Criteria cri) throws Exception {
		return mapper.getGoGrooveTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getKaoticaList(Criteria cri) throws Exception {
		return mapper.getKaoticaListWithPaging(cri);
	}

	@Override
	public int getKaoticaTotal(Criteria cri) throws Exception {
		return mapper.getKaoticaTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getNexumList(Criteria cri) throws Exception {
		return mapper.getNexumListWithPaging(cri);
	}

	@Override
	public int getNexumTotal(Criteria cri) throws Exception {
		return mapper.getNexumTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getSonyList(Criteria cri) throws Exception {
		return mapper.getSonyListWithPaging(cri);
	}

	@Override
	public int getSonyTotal(Criteria cri) throws Exception {
		return mapper.getSonyTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getWestoneList(Criteria cri) throws Exception {
		return mapper.getWestoneListWithPaging(cri);
	}

	@Override
	public int getWestoneTotal(Criteria cri) throws Exception {
		return mapper.getWestoneTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceAukeyList(Criteria cri) throws Exception {
		return mapper.getLowPriceAukeyListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceAukeyList(Criteria cri) throws Exception {
		return mapper.getHighPriceAukeyListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceBeatsByDrDreList(Criteria cri) throws Exception {
		return mapper.getLowPriceBeatsByDrDreListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceBeatsByDrDreList(Criteria cri) throws Exception {
		return mapper.getHighPriceBeatsByDrDreListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceBoseList(Criteria cri) throws Exception {
		return mapper.getLowPriceBoseListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceBoseList(Criteria cri) throws Exception {
		return mapper.getHighPriceBoseListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceBritzList(Criteria cri) throws Exception {
		return mapper.getLowPriceBritzListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceBritzList(Criteria cri) throws Exception {
		return mapper.getHighPriceBritzListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceEtymoticList(Criteria cri) throws Exception {
		return mapper.getLowPriceEtymoticListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceEtymoticList(Criteria cri) throws Exception {
		return mapper.getHighPriceEtymoticListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceGoGrooveList(Criteria cri) throws Exception {
		return mapper.getLowPriceGoGrooveListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceGoGrooveList(Criteria cri) throws Exception {
		return mapper.getHighPriceGoGrooveListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceKaoticaList(Criteria cri) throws Exception {
		return mapper.getLowPriceKaoticaListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceKaoticaList(Criteria cri) throws Exception {
		return mapper.getHighPriceKaoticaListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceNexumList(Criteria cri) throws Exception {
		return mapper.getLowPriceNexumListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceNexumList(Criteria cri) throws Exception {
		return mapper.getHighPriceNexumListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceSonyList(Criteria cri) throws Exception {
		return mapper.getLowPriceSonyListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceSonyList(Criteria cri) throws Exception {
		return mapper.getHighPriceSonyListWithPaging(cri);

	}

	@Override
	public List<ProductsVO> getLowPriceWestoneList(Criteria cri) throws Exception {
		return mapper.getLowPriceWestoneListWithPaging(cri);

	}

	@Override
	public List<ProductsVO> getHighPriceWestoneList(Criteria cri) throws Exception {
		return mapper.getHighPriceWestoneListWithPaging(cri);
	}

}
