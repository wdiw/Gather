package com.Gather.Sponsorship.service.impl;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Gather.Sponsorship.dao.SponsorOrderRepository;
import com.Gather.Sponsorship.model.SponsorOrderBean;
import com.Gather.Sponsorship.model.SponsorshipBean;
import com.Gather.Sponsorship.service.PaymentService;
import com.Gather.Sponsorship.service.SponsorOrderService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Repository
@Transactional
public class SponsorOrderServiceImpl implements SponsorOrderService {

	
	SponsorOrderRepository sponsorOrderRepository;
	
	@Autowired
	public SponsorOrderServiceImpl(SponsorOrderRepository sponsorOrderRepository) {
		this.sponsorOrderRepository = sponsorOrderRepository;
	}
	@Override
	public List<SponsorOrderBean> getOrdersByMemberID(Integer mID) {
		return sponsorOrderRepository.findBymID(mID);
	}

	@Override
	public SponsorOrderBean insertOrder(SponsorOrderBean sBean) {
		return sponsorOrderRepository.save(sBean);
	}

	@Override
	public List<SponsorOrderBean> getOrders() {
		return sponsorOrderRepository.findAll();
	}

	@Override
	public List<SponsorOrderBean> getOrdersByProposerID(Integer proposerID) {
		return sponsorOrderRepository.findByproposerID(proposerID);
	}
	@Override
	public SponsorOrderBean updateOrder(SponsorOrderBean sBean) {
		return sponsorOrderRepository.save(sBean);
	}
	@Override
	public SponsorOrderBean getOrderBySponsorshipID(Integer sID) {
		return sponsorOrderRepository.findBysID(sID);
	}
	private final static Logger log = Logger.getLogger(PaymentService.class.getName());
	
	@Override
	public void prepareECPayData(SponsorOrderBean sob, HttpServletResponse response ) {
		AllInOne aio = new AllInOne("");
		// 使用信用卡
		AioCheckOutALL aioCheck = new AioCheckOutALL();
		/* 特店編號 測試時必須要填: 2000132 */ 
		aioCheck.setMerchantID("2000132");    
		/* 特店交易時間，格式為 yyyy/MM/dd HH:mm:ss，請複製下面四行 */
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		String merchantTradeDate = sdf.format(sob.getsTime());
		aioCheck.setMerchantTradeDate(merchantTradeDate);
		
		/* 交易金額：必須為整數組成的字串，不能有小數點，否則當掉 */		
		int totalAmount = sob.getsTotal().intValue();
		aioCheck.setTotalAmount(String.valueOf(totalAmount));
		
		/* 交易描述：說明性質的資料，自己填 */		
		aioCheck.setTradeDesc(sob.getmID() + "-" +sob.getsID() +  "-" + sob.getsTime());
		
		String itemName = "Gather贊助一筆";
		
//		for(OrderItemBean oib :sob.getItems()) {
//			// 手機 20 元 X2#隨身碟 60 元 X1
//			String fmt = String.format("%s %d元 X%d", oib.getTitle(),  oib.getUnitPrice().intValue(), oib.getQuantity());
////			itemName += oib.getTitle() + "元X" + oib.getQuantity() + "#";
//			itemName += fmt + "#";
//		}
//		itemName = itemName.substring(0, itemName.length() - 1 );
//		/* 填入商品名稱，可用#隔開，可以抓你的商品名稱也可自填 */	
		aioCheck.setItemName(itemName);
		
		/* 特店交易編號，不能超過20個符號，也不能重複(一個編號只能用一次)，否則當掉，可自填 */
		String tradeNo = "item" + sob.getsID();
		System.out.println(tradeNo);
		System.out.println(sob.getsID());
		aioCheck.setMerchantTradeNo(tradeNo);
		
		/* 付款完成通知回傳網址：不瞭解此網址的作用 */
		aioCheck.setReturnURL("/");
		
		// 輸出畫面
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			String htmlContent = aio.aioCheckOut(aioCheck, null);
			log.info(htmlContent);
			out.print(htmlContent);  
		} catch (IOException e) {
			e.printStackTrace();
		}
}

}
