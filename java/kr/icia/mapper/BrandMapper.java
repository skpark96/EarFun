package kr.icia.mapper;

import java.util.List;

import kr.icia.domain.Criteria;
import kr.icia.domain.ProductsVO;

public interface BrandMapper {

	public List<ProductsVO> getAukeyListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceAukeyListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceAukeyListWithPaging(Criteria cri) throws Exception;

	public int getAukeyTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getBeatsByDrDreListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceBeatsByDrDreListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceBeatsByDrDreListWithPaging(Criteria cri) throws Exception;	
	
	public int getBeatsByDrDreTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getBoseListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceBoseListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceBoseListWithPaging(Criteria cri) throws Exception;

	public int getBoseTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getBritzListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceBritzListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceBritzListWithPaging(Criteria cri) throws Exception;

	public int getBritzTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getEtymoticListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceEtymoticListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceEtymoticListWithPaging(Criteria cri) throws Exception;

	public int getEtymoticTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getGoGrooveListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceGoGrooveListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceGoGrooveListWithPaging(Criteria cri) throws Exception;

	public int getGoGrooveTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getKaoticaListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceKaoticaListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceKaoticaListWithPaging(Criteria cri) throws Exception;

	public int getKaoticaTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getNexumListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceNexumListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceNexumListWithPaging(Criteria cri) throws Exception;

	public int getNexumTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getSonyListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceSonyListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceSonyListWithPaging(Criteria cri) throws Exception;

	public int getSonyTotalCount(Criteria cri) throws Exception;
	
	public List<ProductsVO> getWestoneListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getLowPriceWestoneListWithPaging(Criteria cri) throws Exception;
	public List<ProductsVO> getHighPriceWestoneListWithPaging(Criteria cri) throws Exception;

	public int getWestoneTotalCount(Criteria cri) throws Exception;
}
