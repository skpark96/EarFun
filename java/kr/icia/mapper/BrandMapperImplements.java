package kr.icia.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.icia.domain.Criteria;
import kr.icia.domain.ProductsVO;

public class BrandMapperImplements implements BrandMapper {

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "kr.icia.mapper.BrandMapper";

	@Override
	public List<ProductsVO> getAukeyListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getAukeyList");
	}

	@Override
	public int getAukeyTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getAukeyTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getBeatsByDrDreListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getBeatsByDrDreList");
	}

	@Override
	public int getBeatsByDrDreTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getBeatsByDrDreTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getBoseListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getBoseList");
	}

	@Override
	public int getBoseTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getBoseTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getBritzListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getBritzList");
	}

	@Override
	public int getBritzTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getBritzTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getEtymoticListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getEtymoticList");
	}

	@Override
	public int getEtymoticTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getEtymoticTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getGoGrooveListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getGoGrooveList");
	}

	@Override
	public int getGoGrooveTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getGoGrooveTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getKaoticaListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getKaoticaList");
	}

	@Override
	public int getKaoticaTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getKaoticaTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getNexumListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getNexumList");
	}

	@Override
	public int getNexumTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getNexumTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getSonyListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getSonyList");
	}

	@Override
	public int getSonyTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getSonyTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getWestoneListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getWestoneList");
	}

	@Override
	public int getWestoneTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getWestoneTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getLowPriceAukeyListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceAukeyList");

	}

	@Override
	public List<ProductsVO> getHighPriceAukeyListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceAukeyList");

	}

	@Override
	public List<ProductsVO> getLowPriceBeatsByDrDreListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceBeatsByDrDreList");
	}

	@Override
	public List<ProductsVO> getHighPriceBeatsByDrDreListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceBeatsByDrDreList");
	}

	@Override
	public List<ProductsVO> getLowPriceBoseListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceBoseList");
	}

	@Override
	public List<ProductsVO> getHighPriceBoseListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceBoseList");
	}

	@Override
	public List<ProductsVO> getLowPriceBritzListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceBritzList");
	}

	@Override
	public List<ProductsVO> getHighPriceBritzListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceBritzList");
	}

	@Override
	public List<ProductsVO> getLowPriceEtymoticListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceEtymoticList");
	}

	@Override
	public List<ProductsVO> getHighPriceEtymoticListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceEtymoticList");
	}

	@Override
	public List<ProductsVO> getLowPriceGoGrooveListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceGoGrooveList");
	}

	@Override
	public List<ProductsVO> getHighPriceGoGrooveListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceGoGrooveList");
	}

	@Override
	public List<ProductsVO> getLowPriceKaoticaListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceKaoticaList");
	}

	@Override
	public List<ProductsVO> getHighPriceKaoticaListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceKaoticaList");
	}

	@Override
	public List<ProductsVO> getLowPriceNexumListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceNexumList");
	}

	@Override
	public List<ProductsVO> getHighPriceNexumListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceNexumList");
	}

	@Override
	public List<ProductsVO> getLowPriceSonyListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceSonyList");
	}

	@Override
	public List<ProductsVO> getHighPriceSonyListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceSonyList");
	}

	@Override
	public List<ProductsVO> getLowPriceWestoneListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceWestoneList");
	}

	@Override
	public List<ProductsVO> getHighPriceWestoneListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceWestoneList");
	}

}
