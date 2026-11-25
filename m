Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625941;
	b=NiXa8LSs1RVBGlD34VmSK94cl6VKNOWSx7e7GmyRVobRWYhDnzvkjH+VKD1vuhKeNKAW
	 +jGLiYha3d0g+eZ1glNodoTXWnyAxtby4OWLMqlzwtX/2yQHX/y1V34NxV9vUhIvtZqfY
	 QqOZeJ3RXghxLlCoaFlfilxVzwQPeywFD0VysaztDxWwJVvkINt4wyajGQ9/V6WBkURR3
	 LUe/OMNRqy3ePwTvLLINBTzdnRRdhupoEF9Y0LP8tcmASYeRnHA4twi6jy49miffDqGtb
	 WZ0tVZSxrHAD65rXrLkbA0nNfZllSDxAf6cmrfTFCqHn16GxHYzXmW2fY8Qz+Kd/SRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ssqoSi76g+LtX30iLsvIWKdf1J/8p1hvBN52gnrjlGc=;
	b=4SjiX46MQOj4iBVnF46z3OEbaAnT3ZVDKrgeaYbGKUvUv+Vlab9le6EupKTmuyVbj7Aq
	 XY0PX6AAqTcXB/Pj6O2OEnSoepMmtNbhDh8OuHZK47GPy7HZb4sEz1vloDEkOGvgPV+pG
	 w8vU8FQ7iI/KjMM2i5Z0DwmJg916qws3yvXaNMpiro9RD9U8srYG1dHadyXbgknnP3dr8
	 Ld+j6zzLSO/md/DI1IGK1o/rcM7ivQjv+Q8Rbn1KUggLRGYmmynIbPXcg+hnX6UPxHA3E
	 BOeKPtYG/5wVBuwFDOnXrfFM+HTd+YJOaVcyTYC3xdnGm5HdR50cher4JU4nY91+1Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=duZulkev;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61892606A327
	for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 16:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61892606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=duZulkev
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93a40a9a01aso816855485a.0
        for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 08:58:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625939; cv=none;
        d=google.com; s=arc-20260327;
        b=cSA7w0NF5tDOOmpiVDPVMbIHRgVkD8veeLzmTXa8QA/swQ1Gj4T11EYCrOm6G4BZ8l
         JZDp73pE89wKe+beoxDQ/6Fi95ZjJ1MJCjlLCZ+qltYNNBMKo6dTKj7vTcrnNXa8+qjl
         RCb/rzxLl0ZeE+qWESI66AK7AIt1uOfG5tVIJdtLWFHaFRk7Z98z2dAzlHHmJWD6VsDL
         YksbBDcVL20DogiUmmInCEiG295lZ0ZtnMCF70Oi900814T6vnRzSl6YjLVqfwBf2Rlh
         vy0HHrTi5GJXKC7GosBY9+AZvoARi0cUoc++JDmT2rwNd6lUlZB9FyyCZ6DQmUZiGkm+
         IW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ssqoSi76g+LtX30iLsvIWKdf1J/8p1hvBN52gnrjlGc=;
        fh=HXZKZ7PeeU3dPp+lyIukoOPwsYNuhY9dseC9A1nlEws=;
        b=oBDfyLJ2FgsAX/QJi/KUzsXysmi6LbYU9spUsHqmUv9wgFs9ZJcL0NZtpsQhgxG/2P
         nkVT/rHItlF1eNT8EiNRXTrKdLcbJQ94F2XboE7UGaDUgMytTs0T3VF0/W3h2Oi7clca
         Liaeqg63cZq/CKDiz7PTETwc2sxmY/JcT5DlYJUYM1F+na0ybd6phEYpuocY2u+XqmuS
         tHJb6LHXTCEzP0QnsmJQbFiLUJw1957gLS9sDcs26Vuja+6YkzZ5OaRV4Ek5KIsXSzWP
         U5XXMnh+MwIcYtvfR8i5cimW7faFk4EqyezPv8FVfiGl3m1THcEQdsmrnlfnOKYtiI8x
         dTIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795625939; x=1796230739; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssqoSi76g+LtX30iLsvIWKdf1J/8p1hvBN52gnrjlGc=;
        b=duZulkevpOc+pBl5StwZTMdVyHMurJ/314W0Phf8WHLVt0kQEZ1TM6qiDXeHfaBDMG
         eq2iHuGqPcomAbweQ0h7SVhQzGTPW+qzGl4t7RqzURUgnUAoBzI51+zIXlZCc3VBJ40H
         Dp/MzTSBXfYoZ65rrdPx68mgYR7WWmwNKrMRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625939; x=1796230739;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ssqoSi76g+LtX30iLsvIWKdf1J/8p1hvBN52gnrjlGc=;
        b=MLFCaZE+Amu5pKZv29AIIrWzGuO3Km3vIE7YwLBt01KL9b8jbYMqanVL18IBLZyXCc
         C8y6bph9fuV7YQqTsv/oPdY4VXW6w7uSXmHIs828s/6SAFM9iZRwiis2oV499urmv3fd
         AIP7k/k74czyG6q1AdHrFHjWiHvfcNzrQCWdjO2QLhSn4TGEhMNOQLIM2QbYPYaPGbPh
         h6t/MWdu2EvtbVkYSwzm04PNAQ9A/PmNYdgEd3+uZ8iEqJ/0CVXZJjw7K60Iq0YQwBgX
         2GvmrNgD1ApSWjWPm+G8RntjHi/9dlyGMM0ZoxKRgXbqjEUX4wZL/odFH7hYWpNRs7Aa
         umVA==
X-Forwarded-Encrypted: i=1; AL+hErG9sxtVSXAXUW5RgR9HdFsq4ceLNCGh+sGJmWdmYu9UKQHwKNkmeJFQjazQEcdX0hrPrSgW/XJgdsWA@lists.linux.dev
X-Gm-Message-State: APuU4Z9in41u24fmFQnz0+Vefoykq/4toDEOKnyhLgErZr19L7s1gOLZ
	eZsVGGAk0yYDC6DMLUKpYF71uh0cA5YVkdAynJW6cqMhWgDSIxt9b+Cg+68lK1b0t8Co4DHdbIm
	GXSoT6HEGESX/Way2N4KiwDx1+or5GbvHRDKbp7W7bQ==
X-Gm-Gg: AZFdTZcHKNsZC2Rl+9EsAbrHpH1aty7NiDQoPRy76bKT1LVnNipnkdgOw9IFQvLALm+
	4stJdZghk/rs9J1u58A1JV3AbXB0HoP5J0g1nUfDBz8NVHne1e4/wktRwjTkQ3lJcKwKgMn23Ch
	3d1UcScMq4XfYBuBP8CQ2jU9ZktXkTO7ilNokbqL67ApVdv0VHmZTi0qkLMO4g/Xfg5e+gmuiPH
	KlgcMg4NB48TEa+mdYdEhasZe392cbGekC9cenB+T140J4HreQQRVspkUvvCfeov0cMr/feSY5U
	xwYpRKWP1nuig5f2mLzzubq5aZUKAJEJGe91EB/RBe0J/FZLorSjNwVxDS4R6GKfDQlGSrPmFYL
	TEIYFeT+V8+PPT4KgR15Rwwh0GGw1oL0aoKavOMWWdWhfwsSM5nFPPe6LGrncBXwKdUvctQ==
X-Received: by 2002:a05:620a:130f:b0:93e:95ce:5394 with SMTP id
 af79cd13be357-949ba81953fmr3086387085a.2.1795625939096; Wed, 25 Nov 2026
 08:58:59 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-work-fuse-readdir-v1-0-44312add01a8@kernel.org>
In-Reply-To: <20261125-work-fuse-readdir-v1-0-44312add01a8@kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 25 Nov 2026 17:58:47 +0100
X-Gm-Features: Aa3M54pPfuXZohQGDn5k0h9sL1sElbGXsBZCEsXt30y_HQ67RFbg9tpBWfdjmqU
Message-ID: <CAJfpeguDMe4ZooXec_djQ_Kv2jL4HNum=LvhUtA9iPrHStgnaQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fuse: fix readdir with long names
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 11:27, Christian Brauner <brauner@kernel.org> wrote:

> The first patch makes the request large enough for the largest entry
> the server may send and makes sure we always have the pages for it. The
> second patch adds a selftest. It fails on v7.4-rc1 and passes with the
> fix. I also reproduced all of it in a VM on v7.4-rc1, including the
> memory pressure case.

Applied, thanks.

Miklos
