package kr.icia.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.icia.domain.Criteria;
import kr.icia.domain.PageDTO;
import kr.icia.service.BrandService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/shop/brand/*")
public class BrandController {

	@Inject
	BrandService service;

	// 관리자 화면
	@RequestMapping(value = "/brandAll", method = RequestMethod.GET)
	public void getBrand() throws Exception {
		log.info("get brand");
	}

	// Aukey get
	@RequestMapping(value = "/aukey", method = RequestMethod.GET)
	public void getAukeyList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getAukeyList(cri));

		int total = service.getAukeyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Aukey get
	@RequestMapping(value = "/lowPriceAukey", method = RequestMethod.GET)
	public void getLowPriceAukeyList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceAukeyList(cri));

		int total = service.getAukeyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Aukey get
	@RequestMapping(value = "/highPriceAukey", method = RequestMethod.GET)
	public void getHighPriceAukeyList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceAukeyList(cri));

		int total = service.getAukeyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// BeatsByDrDre get
	@RequestMapping(value = "/beatsbydrdre", method = RequestMethod.GET)
	public void getBeatsByDrDreList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getBeatsByDrDreList(cri));

		int total = service.getBeatsByDrDreTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// BeatsByDrDre get
	@RequestMapping(value = "/lowPriceBeats", method = RequestMethod.GET)
	public void getLowPriceBeatsByDrDreList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceBeatsByDrDreList(cri));

		int total = service.getBeatsByDrDreTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// BeatsByDrDre get
	@RequestMapping(value = "/highPriceBeats", method = RequestMethod.GET)
	public void getHighPriceBeatsByDrDreList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceBeatsByDrDreList(cri));

		int total = service.getBeatsByDrDreTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Bose get
	@RequestMapping(value = "/bose", method = RequestMethod.GET)
	public void getBoseList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getBoseList(cri));

		int total = service.getBoseTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Bose get
	@RequestMapping(value = "/lowPriceBose", method = RequestMethod.GET)
	public void getLowPriceBoseList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceBoseList(cri));

		int total = service.getBoseTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Bose get
	@RequestMapping(value = "/highPriceBose", method = RequestMethod.GET)
	public void getHighPriceBoseList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceBoseList(cri));

		int total = service.getBoseTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Britz get
	@RequestMapping(value = "/britz", method = RequestMethod.GET)
	public void getBritzList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getBritzList(cri));

		int total = service.getBritzTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Britz get
	@RequestMapping(value = "/lowPriceBritz", method = RequestMethod.GET)
	public void getLowPriceBritzList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceBritzList(cri));

		int total = service.getBritzTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Britz get
	@RequestMapping(value = "/highPriceBritz", method = RequestMethod.GET)
	public void getHighPriceBritzList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceBritzList(cri));

		int total = service.getBritzTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Etymotic get
	@RequestMapping(value = "/etymotic", method = RequestMethod.GET)
	public void getEtymoticList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getEtymoticList(cri));

		int total = service.getEtymoticTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Etymotic get
	@RequestMapping(value = "/lowPriceEtymotic", method = RequestMethod.GET)
	public void getLowPriceEtymoticList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceEtymoticList(cri));

		int total = service.getEtymoticTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Etymotic get
	@RequestMapping(value = "/highPriceEtymotic", method = RequestMethod.GET)
	public void getHighPriceEtymoticList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceEtymoticList(cri));

		int total = service.getEtymoticTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// GoGroove get
	@RequestMapping(value = "/gogroove", method = RequestMethod.GET)
	public void getGoGrooveList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getGoGrooveList(cri));

		int total = service.getGoGrooveTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// GoGroove get
	@RequestMapping(value = "/lowPriceGoGroove", method = RequestMethod.GET)
	public void getLowPriceGoGrooveList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceGoGrooveList(cri));

		int total = service.getGoGrooveTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// GoGroove get
	@RequestMapping(value = "/highPriceGoGroove", method = RequestMethod.GET)
	public void getHighPriceGoGrooveList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceGoGrooveList(cri));

		int total = service.getGoGrooveTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Kaotica get
	@RequestMapping(value = "/kaotica", method = RequestMethod.GET)
	public void getKaoticaList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getKaoticaList(cri));

		int total = service.getKaoticaTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Kaotica get
	@RequestMapping(value = "/lowPriceKaotica", method = RequestMethod.GET)
	public void getLowPriceKaoticaList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceKaoticaList(cri));

		int total = service.getKaoticaTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Kaotica get
	@RequestMapping(value = "/highPriceKaotica", method = RequestMethod.GET)
	public void getHighPriceKaoticaList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceKaoticaList(cri));

		int total = service.getKaoticaTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Nexum get
	@RequestMapping(value = "/nexum", method = RequestMethod.GET)
	public void getNexumList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getNexumList(cri));

		int total = service.getNexumTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Nexum get
	@RequestMapping(value = "/lowPriceNexum", method = RequestMethod.GET)
	public void getLowPriceNexumList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceNexumList(cri));

		int total = service.getNexumTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Nexum get
	@RequestMapping(value = "/highPriceNexum", method = RequestMethod.GET)
	public void getHighPriceNexumList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceNexumList(cri));

		int total = service.getNexumTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Sony get
	@RequestMapping(value = "/sony", method = RequestMethod.GET)
	public void getSonyList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getSonyList(cri));

		int total = service.getSonyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Sony get
	@RequestMapping(value = "/lowPriceSony", method = RequestMethod.GET)
	public void getLowPriceSonyList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceSonyList(cri));

		int total = service.getSonyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Sony get
	@RequestMapping(value = "/highPriceSony", method = RequestMethod.GET)
	public void getHighPriceSonyList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceSonyList(cri));

		int total = service.getSonyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// Westone get
	@RequestMapping(value = "/westone", method = RequestMethod.GET)
	public void getWestoneList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getWestoneList(cri));

		int total = service.getWestoneTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Westone get
	@RequestMapping(value = "/lowPriceWestone", method = RequestMethod.GET)
	public void getLowPriceWestoneList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceWestoneList(cri));

		int total = service.getWestoneTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Westone get
	@RequestMapping(value = "/highPriceWestone", method = RequestMethod.GET)
	public void getHighPriceWestoneList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceWestoneList(cri));

		int total = service.getWestoneTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
}
