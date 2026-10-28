Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205061;
	b=mwEnLX8cPlctSmQ+DjIHWnczBn5+6WSs/KxzS3oB/TpK4d6CflJge93e8oRRDTwa8Hsf
	 B3xMATgl89ooHrpStgmtYsZiD/ZQr6/F+w7wtPHBAE3wwYMmYcPMgWUdeYYiSdsPJCZIx
	 MiO8XaPiBi3G4JwcZlsUYyZPcbIYNDRYoL3S+eHvZxtbSOAo2V0npjnQeJQz2PJdSyRPU
	 jzCsk9VGt71Kk0+++Fc7RrpdWjF1jEUQUa5KQcaKpwVweAJf9G9A5L60rUdsUKYfhvLkj
	 ITx9t7/Z4AfiTbGFuMgzuj0+e3Zact23UlAFDVPcu+09Sk6p2BP703hMl2zIKWdkfzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205061;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=siX+q/aR1JD2WsD+b2zUvb+1Z7+OJ4XfDNBBgky8Yg1I7oN9TwvCqa8bC7opmaBSdwfD
	 7ii+M4r1VIFI0+3RshxKWlfCT6Y2zezTdMgabLthz6jNRv1ATTy9DCegI5ock+5pDBOpq
	 Q8HC5ufMVgrI5IpHfTpLP2H4UHXFeqvso531fdeAC/j4X/L0d9IHqwtuVzJ69t8bgX6Py
	 7lM/C5QVFa5V+/5JIfWstZbh/xLjWD1ngT3C+gXmRPGsHIfQQ8GvnBdDMkjL0fuztW5uZ
	 LEpKUs1etIKmN+OwtLnNzLUGLJw1++PTWtAtJWXiyVspkrOiFvQWHAVrt4uF74v8Aew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C474606A31F
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 16:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C474606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DFE5968AFE; Wed, 28 Oct 2026 17:30:54 +0100 (CET)
Date: Wed, 28 Oct 2026 17:30:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anuj Gupta <anuj1072538@gmail.com>
Cc: axboe@kernel.dk, asml.silence@gmail.com, kbusch@kernel.org, hch@lst.de,
	sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
	mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com,
	miklos@szeredi.hu, io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org, fuse-devel@lists.linux.dev,
	joshi.k@samsung.com, anuj20.g@samsung.com
Subject: Re: [PATCH v2 4/5] block: map dma-buf iterators in
 blk_rq_map_user_iov()
Message-ID: <20261028163054.GA22862@lst.de>
References: <20261022144501.2478417-1-anuj1072538@gmail.com> <20261022144501.2478417-5-anuj1072538@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022144501.2478417-5-anuj1072538@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

