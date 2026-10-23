Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792789088;
	b=FZl8aSLWyk/ZCT3o2pjdCwuVLZvDm53teHH+M3E1x/f4FwpYKzq6CEi03oMppFJEqDaj
	 HWbjLca7/AahdhXaYQ4XxOfSAcg2wueKLU+ZT2zPMjzv+eE55lig0QdrTfrO7161neQ10
	 h+s17jfazcfLcc0IU67vkz1x1COhWRSI+5Jzr+6I97LGX+JgHEMQ02fIgIUvI9C6vgnZO
	 sD6/B9UaNq1Kn6YAiukW6Fx1VTKUSLlVEKfYdt5Xc649KvevHFPhTe6KwOLLat4VEyO5n
	 SlsIMyEQrFUy7voWhNcrs65E77Dy7pO2Ct58gUdxsoN12bZslgBkFmMWrWW2dOVQb3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
	b=V6YqEUroKzUtGXsWDC0BiBG+13poWHv8vMYPGDlvSQvNav5HcLsvgfDDVvp9TgmA/VLJ
	 jMP3UJ3N+5G38zmV/oSxF1fAjecl/+/5VSm6asC9bG7ZXUXu2vVcwT52EYc004UDdo2e2
	 koXdLAqr0kB1KNqhMaC6BZd7NMZ3vmV76bm4pPYWZUEY15lm5JcOl5Z1cVoFoGgXsvwxC
	 ThU3CDoeM+zANr4hQnUeVbXzWGoI3mC1qW8OdixZkop0lWx8YW4NZfS6O/rUWWXOa0sdf
	 juePekmzcI6VPtDljj122nI7Cc0Kmn/EFyWqfUPiuOhBsacEkn5BFg4ihkufjTywSjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=gQ29Kq7w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996B606A31B
	for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 20:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1996B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=gQ29Kq7w
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5365f9bef55so21712831cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 23 Oct 2026 13:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792789086; cv=none;
        d=google.com; s=arc-20260327;
        b=qoSNg3uh5yMXaCJHtHqL3fM7RHbECStsEssuwJxMDQWLwLcurI9SwT7jsTwqmn4pND
         oP5uf5FmzOdY8jXidxPBYmB8+GoctnJQJg/lfPdYRnbSxBTq+rqMJkqhYAcht7DVAM5n
         HtSjeDSD8/AitHnfQ9GSoSxO5bN8g7Im2Yt/pz5zYC/3kvIB+xl1eR4XvR487zSoUhEr
         mmxC+BvKruentdJ/CVRkSAsdRc13KMMVp9GQmHZB0Yt21moZezClnHULEvuk+EKMMTT0
         IxE0TwoTXOy9D0WDBxoC49i/EUkv0DitNkrIzXUnG4G9bIawdejbesy/JQqR0nvdk7bk
         v89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
        fh=jGGbhzDhaT0Fjz8yAShgRgVw7U1yQARTHFG/9oIXKWM=;
        b=B/j+bxHzq7I+70O1yjsQ8gXjA2/EbR98rppQCFkr3MhgdUeawRWrLELLXFGGUD8BzW
         6FHtV6vs+2xqlgyhFTtKk/9diuCmrjarT4PY9NrvT8BWa/pe+DfFx1WahRhILtVJMs5s
         V6xjn/xUGWJOw1TRWUh+jadW9XTWM3p/jEcBkcqsuH9zxE8y21Vur8Huiw/HWSHA5fB0
         KFiP6mmksxB4UywVDP22qrVweEX7vHwmbAK1x49ttYwjjehDu2hmNuXESyWrniLZgO4M
         BDK0tOILLoiXvsZ0vHHRSZx3wsuOUlhM2OEsovR1WOo3jU1oaRfsAVLe/WKY/2jmjx8n
         POFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792789086; x=1793393886; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
        b=gQ29Kq7wb6f6wD2M2zjCMK7usdfAS+k94PJA9IbeH4e/izxlh2o5uE8DE75ekqydXp
         0pfdY0oFOgW7NpU0OJE++fx8XJJNtRQ106w/ypZkffq1S+rWBn2V9PjYEAR4+iAr+a+E
         qeb/gcVrOfMMyBz4ific+MBXuSeI0xkFbC9VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789086; x=1793393886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
        b=pZTNOCOzDB3oRMsHzUmM2jdVCPpImDaWEfusFib8ZR4CbE7alBsOG6vxW62Vk9Lv/2
         Sw7UIXodANO0heAqFhkCThsbznoY7yJi++dpjJKZyJxlxWTeWY+ITwCK2FibgGow8GTi
         JjyiQ9nJkTtt1ImFrEt/JJkFon8wj/oN075/BhLBJ5qiMR/doz3UjGOMP4NO7yB48B9m
         R0POisYINEiMxECCkO7+TbHrxUs4Jt/ngRdBYENF3iylzYcyVf+w9/1OweVnBTHxi0DD
         jD5e8RrblttIGaVgcRAXfgSHv6L/2X7hH21OHFdSc6Xhhi5/1CWoAWZxSlVbsf8pQsvd
         BvVw==
X-Forwarded-Encrypted: i=1; AKwUvBzAo46EvGu048AXLThoJA+oBqR/7e23f0Iq0sTpDunDN8Mbk/ZMB+FzXDZcEDxgl38+c7ekLMg5BcTK@lists.linux.dev
X-Gm-Message-State: AFq9FYI+RiIDiPzvfFNixP8VNLtxcC62IyOB0ZiTl/mls/Y3Z1VNeU0P
	6tUasDxl7GTuW5WGIiaOpUcDQJW56S3pe2jdOloF03+0hbHfobaFVr9rcHvQn8Kv+yq0IGIknGB
	QMRyILQP+c2Kp2OxED/GtRm7iLGdURtB4fr+UkZbhFw==
X-Gm-Gg: AYBFou1JjxvWkYPoSROd9J3W+uqFidjwYpG4o05jFTMpOhUMOdSwQobNJ1xyAwY2Xta
	XNQq8TIMkhgNvgYSvr1L9e3Nk/hcPyrE0xBtYyFURjyyp3UrVBxstzflNnj/NK3xeNeIi6xsIkU
	EHcqz/CIcQdm26ea9m/sbXEFdKs3/lIvOfAIltoa76ze9CLUJB9xDKwO/4b154gbzmTi6enP5Za
	COBbJ+QsVr4fTDUvLFwsvqvBwixpaUlGAO+CK+H+qE3y3+Zp6uS+wY2nLwwjm4O/CtekUvGDUvW
	j9uirIkzocGTsuiwn/1wdO93IhFuqjou8xfP+gJ3H+R5HKakxWObbK5eKgWSJZGna4Vwq0WvaxA
	VhBUGDUlou8KSiq94CIAeZGLc8XBrh+1Jyle3amcpxYzGTtgyziXNcbnJFtNCPgamnpdadrAlzZ
	sUqojgEZ2hblkq75gG
X-Received: by 2002:a05:622a:5b9a:b0:537:636d:2f2f with SMTP id
 d75a77b69052e-5383bb192a9mr156221cf.29.1792789085714; Fri, 23 Oct 2026
 13:58:05 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <atqdWUCzGxs3wwXw@groves.net>
In-Reply-To: <atqdWUCzGxs3wwXw@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 23 Oct 2026 22:57:54 +0200
X-Gm-Features: AclHuK_KkNk2plVzgFzI4sjd7Ztsti_roGPlFUeDExwL151cFclpP2FgDKprhXY
Message-ID: <CAJfpegvx9qi9ZcicxdLdmcwqnS0Z4sKQTdNo-OH7=6i=iYmKxg@mail.gmail.com>
Subject: Re: [PATCH] fuse: handle extent map files in fuse_passthrough_fadvise()
To: John Groves <john@groves.net>
Cc: Amir Goldstein <amir73il@gmail.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Shai Barack <shayba@google.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Aravind Ramesh <arramesh@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 01:47, John Groves <john@groves.net> wrote:

> Fall back to generic_fadvise() when there is no backing file, as the
> other passthrough helpers fall back to their extent map or generic
> implementations.  generic_fadvise() already ignores advice on DAX
> inodes while keeping the EINVAL and ESPIPE checks.

Applied, thanks.

Miklos
