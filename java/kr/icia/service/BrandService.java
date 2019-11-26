package kr.icia.service;

import java.util.List;

import kr.icia.domain.Criteria;
import kr.icia.domain.ProductsVO;

public interface BrandService {
	public List<ProductsVO> getAukeyList(Criteria cri) throws Exception;
	
	public List<ProductsVO> getLowPriceAukeyList(Criteria cri) throws Exception;
	
	public List<ProductsVO> getHighPriceAukeyList(Criteria cri) throws Exception;

	public int getAukeyTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getBeatsByDrDreList(Criteria cri) throws Exception;
	
	public List<ProductsVO> getLowPriceBeatsByDrDreList(Criteria cri) throws Exception;
	
	public List<ProductsVO> getHighPriceBeatsByDrDreList(Criteria cri) throws Exception;

	public int getBeatsByDrDreTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getBoseList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceBoseList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceBoseList(Criteria cri) throws Exception;

	public int getBoseTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getBritzList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceBritzList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceBritzList(Criteria cri) throws Exception;

	public int getBritzTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getEtymoticList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceEtymoticList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceEtymoticList(Criteria cri) throws Exception;

	public int getEtymoticTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getGoGrooveList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceGoGrooveList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceGoGrooveList(Criteria cri) throws Exception;

	public int getGoGrooveTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getKaoticaList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceKaoticaList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceKaoticaList(Criteria cri) throws Exception;

	public int getKaoticaTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getNexumList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceNexumList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceNexumList(Criteria cri) throws Exception;

	public int getNexumTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getSonyList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceSonyList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceSonyList(Criteria cri) throws Exception;

	public int getSonyTotal(Criteria cri) throws Exception;
	
	public List<ProductsVO> getWestoneList(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceWestoneList(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceWestoneList(Criteria cri) throws Exception;

	public int getWestoneTotal(Criteria cri) throws Exception;
}
