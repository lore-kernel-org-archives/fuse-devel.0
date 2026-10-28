Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205076;
	b=B/p3iBL4Id9kUssNhcPTQG4+Y8QeOIaPv4oX5dFa+qQOMuTaWDKjr1Csqa1B+VSlNiN9
	 NMEyS5RxQeTKbeXHWhK8u1ksqW0FINHZTkgsOhHkMgQx3EFk0S5k4jTIENHTwsLmDTt4t
	 ekd/Xf5RoFEwmgnFO9Csz7wBYbTaZ+kY1A2MoJYfQ7+i/EiyUomF3/uotLlnDJgYiY+Ry
	 JfkM2S5ucweLidjfDImaJEBOMPA60HWZPf82khM2/h94YKgbBX0YEoFSwF5ZjhDUcZylK
	 udpz8aCwtx8bg8QmuKB8ORxJWT4/AQ3opYnbpoggr/bmqwj1gvRCQTxGbu58LhIkBwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205076;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=wBukjfD+QwP+UQGi2p8LV/bKRHtsqMJv008Ww77aPHn8+S39m7rvwA5QLBsmxbKhDojD
	 Cx2sZFtzUmnynTnG9rfTJcuFly1++ckP73ZvX5oqu0lO5Dg1+/Z092WTqMMwUEPEhBM7O
	 qmg8Ny0Nn+686cFveidJotzc2DoelBucnPcD38UCv8ZVN0w6dIKL4FXtHDDrBs3fxgqny
	 UA+FD4BijHXf+ZOQuk2G4i8hsu1jgNo8QML3JEhJcsge7tXqEcHmmtgXmNt4OwqpsY9jL
	 FnWlMF7Fq8Y7AnUBsOVkKF1qqNQjvJX6ijEVHvCLrdr/L1fzZA9g3kdLu/tZxKRuyXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF484606A31C
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 16:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF484606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 60B8E68BFE; Wed, 28 Oct 2026 17:31:12 +0100 (CET)
Date: Wed, 28 Oct 2026 17:31:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anuj Gupta <anuj1072538@gmail.com>
Cc: axboe@kernel.dk, asml.silence@gmail.com, kbusch@kernel.org, hch@lst.de,
	sagi@grimberg.me, James.Bottomley@HansenPartnership.com,
	mkp@kernel.org, bernd@bsbernd.com, joannelkoong@gmail.com,
	miklos@szeredi.hu, io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org, fuse-devel@lists.linux.dev,
	joshi.k@samsung.com, anuj20.g@samsung.com
Subject: Re: [PATCH v2 5/5] nvme: support dma-buf registered buffers for
 passthrough
Message-ID: <20261028163111.GB22862@lst.de>
References: <20261022144501.2478417-1-anuj1072538@gmail.com> <20261022144501.2478417-6-anuj1072538@gmail.com>
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
In-Reply-To: <20261022144501.2478417-6-anuj1072538@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

