Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00230336884
	for <fuse-devel@lists.linux.dev>; Sat, 19 Sep 2026 05:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795265; cv=none; b=T86LMoDKrXdSlV46Mzne3sUp2TDOrhL97l0IOQkNWGeMh3H7tpNLeyGI36ioTfdJzcKlYezY7bSvC+pBwYVFWHTkXZF7E590CkSoSNw3D2NpjNmDJPVyCgkWTlDSGDZJtMn2B34k8aTA7OTUbGdcxFUL2RE9IkA8xeexXD3o28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795265; c=relaxed/simple;
	bh=wbl/b1wY6W+ED0XWbMPTjA4NropJyaS+Z6oeRQIiRso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQCe+bhUwMbkRKbLgNKViG+kKgp7JzD+QGeJFoU6UpWixvpGJ3C10MZ8mzlBjXFiGPSqnu7Fn/GgYrsSedYTzPdCdEAW5eAR4q4x3rRt9KbwckX+7f3vJLQgl+yUaveGQI1Bs1a/yBH4BvyCEXKEpebaFCFztDSA61hi12sUSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+4WWPG2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+4WWPG2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso12147655e9.3
        for <fuse-devel@lists.linux.dev>; Fri, 18 Sep 2026 22:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795262; x=1790400062; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j71MR9mSV+x9BS9VkLQyl8CosM5qjIOpfqaZrZTUdQ8=;
        b=i+4WWPG2PmtupCHwFPOEPdWd+zEOfwiXbNVlHF968oYibo08osnXrJjXipJCiBtu85
         8u+YZeKHavwt+0jTrhx8lO6n42DLL7dUt1qJzHCHdBTl8orCuUGP8CYPiHOJQos2PCse
         PcQWRlthXYE7Jh3MXKPFXCUiUPtW9Y8MJYPamF/NMSxe42E65T/Ra1Ff+BHkvF4X2yEu
         UieFI0f9PnM7giXEKAgPJnqjgWi4wd4unmdO2himVqH5gtESe4qa9wmVRR/2Ghvb2WvO
         eP2uN1wgxhvHezIkS8jvu1l7SYVaylTJEM+ZPYRzij/921K3kgZMth0ndGM7kVkDDj1S
         0ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795262; x=1790400062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j71MR9mSV+x9BS9VkLQyl8CosM5qjIOpfqaZrZTUdQ8=;
        b=p/Z7cV6hybL1g1tUK3bPefNGkxzcvloG12bFD6U/tvIT9tST3vOf9iCOu+r+lrGccx
         z+plcAgHPU8YskQ6RUINWD1viy5q6GR2P7x8AHAJ9t3d0S23sN/wQp66ijruZxEh9ubB
         96mVD2gf39LWpVPH3oWtrVXuEag83Gnqq+cFK+sDsJpkL+qus9BmvzTrNdn32cQ/FQ3k
         Xrl420MUB/t9IRsAz/VxZez1F3nGoAjmH2e3UdGym/lgvM8YJTyhuVoKbmT8TpHxoG5f
         P+YFglIIUhbku47ljorTCmKrom7CNA3QcOEpEge/sJ46NOjoRGoyAv7oFKINp+SW/Q5w
         uPsA==
X-Forwarded-Encrypted: i=1; AKwUvBxqTHMqJdfOHQrspjdwSEOgu5RdnrXaZnlalq7JWsDKwnAsajMPknYTa4ag7hCaxM9HDNILvE3+5s2Q@lists.linux.dev
X-Gm-Message-State: AFuF++nbXvnzwDZYCSrKrVnv82QUig4Mc9NruXTGJUjCFA5Jjbec6mIc
	d1qJC3lia6zdT99basX0BvehKYPhMT+XHzS0ZxBfkH8wJoZkYY644NEX
X-Gm-Gg: AYBFou0F8RZf9lb1PX1yBfbTmn6K6v2hMeOIzb0KHkKP60j15y4yqlla1qy/d4b4geg
	8aQlTn8Wqz9ug+jb0zxe15knucC/y7KIQkwB/OgDGuDflDWzTRpVSmmDD9JowGGhGv00x7bK/yf
	GZzZPJpJLPZtjR4DLIU0dqGd4rIdpLHmxn+/vTnsvDU83lo3XU5MUiGmQl3GAciRoUGeqBLyNxW
	ZTv+zL/wtBf7EVUQWAEPQNMA79p2EtIxmB/tsa7QdFqlmjHGVaUYXe0y8mBM9/PbgqgRI2v4qjZ
	CfEJ1jjdyrG7Pm6h9xYtx2YFbrojWrjPn1697c8iO37CjIhq52sG8zmavQbV7wDz8uhiKcWC5wl
	+E9UlwwVEJ1u9/QpswNLYfwOIV/F996+rvMwjqy37ICZ7FBNMI40+QXMI6KrFs6BLScm5BJYRbU
	cFMkYja/8NKYNh9GqBO2wUf6qepVV1kOdBQrpO6jx7/rcvignz5RMdxfYz4bby9LUPqFTP6aWV6
	SwDcKCegKjD39VVeLvt8q/b0AhNAX8YagxI1SFoVOmLwTrz4wrtG7/62PYE10a7W2H0ZseLrv97
	m4L+DZSA7FL3jkO7gLa2wGws1W+oJ2gNGSccRt9Shg6Sknwtsl5I9ssikEDr2Y/LnTSWXlCw3t9
	sRqsqsMAlZ0kBY5M=
X-Received: by 2002:a05:6000:4b09:b0:485:8ee0:dfc8 with SMTP id ffacd0b85a97d-4871e26e3ffmr6296658f8f.41.1789795262086;
        Fri, 18 Sep 2026 22:21:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm4170213f8f.10.2026.09.18.22.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:21:01 -0700 (PDT)
Date: Sat, 19 Sep 2026 07:21:00 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Cc: Joanne Koong <joannelkoong@gmail.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES
Message-ID: <aq4bhxra9UsLG56n@gmail.com>
References: <20260811195733.38489-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811195733.38489-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 09:57:33PM +0100, Karl Mehltretter wrote:
> diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
> index 29578104ae6cd..3370ae344f751 100644
> --- a/fs/fuse/notify.c
> +++ b/fs/fuse/notify.c
> @@ -153,7 +153,7 @@ static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
>  
>  	nodeid = outarg.nodeid;
>  	pos = outarg.offset;
> -	num = min(outarg.size, MAX_LFS_FILESIZE - pos);
> +	num = umin(outarg.size, MAX_LFS_FILESIZE - pos);
>  
>  	down_read(&fc->killsb);
>  

Friendly ping on this build fix. Is anything else needed from my side?

Thanks,
Karl
