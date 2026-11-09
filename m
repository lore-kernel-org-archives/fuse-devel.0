Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242048;
	b=F5li9fuWMfcBOGuWaNmULeoux4hfgKEqRtES54jPbHBlb67dW0PsnXug75wOv7//7v3U
	 U4poW6cfiXzkQ/WAxlvf+PXuZfbq2Jt7047eO1YOUHzb3tAMB7UHyylZ1snQbMkAjwdCr
	 Q8dk5SLX7V/0HmFePwHPpm0+ZkTVlVnTpqPUlxLDFEfbZcJrOZAxClfNKg0+yD5sow/Mv
	 Wq9sFkl0JjXvPufOl71OcBZ2BTzsFeh1Xd5yodvRAADivSF7ucKMVAHpCn07zyx8qVXMm
	 VmFpYnZInzfKUMhthN+tO6/kyzqPHKamupR+ANuEz9BePCzrsub89YhM86JmXojeMyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RXXU/zrEl8TcSV2xj8OBdFZs1lPljfbXu/prQveYVIU=;
	b=x+gHdH+G3akJ4RIYk8U1Z5RhsaeLp0NhKoJp0mKe0V29Rq8mlCvGlNm5zax61sRGHfh6
	 RNzfnGn9n8XJ9MnXJur0LNCuTdgEGdYndeelsRjFpLQQw8ljicgRh3VrbZQTUcv9CDTC4
	 2DONak+6o9SULjRuOWHp8173r9cCfReKyMRVumFO4uRPXPHjNREYCzruR4QBIQttWUUxQ
	 +HTFvp2r06zJ3TgIlcgH95gbWtd4hoNIx+hgNaVgGko3mS52tBJouT9eCo++2+GNkZIpU
	 gndVm5tjmM6eeUQS7Q1EW496RSkv5FbaldW8Z69tcUvOc5AFFqxQE+HlF0bJ6L20viQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CZcDEnmu;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F2606A31C
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 16:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A5F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CZcDEnmu
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so146043966b.1
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 08:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794242045; x=1794846845; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXXU/zrEl8TcSV2xj8OBdFZs1lPljfbXu/prQveYVIU=;
        b=CZcDEnmuIZA69n9WBecSvFCDVYR/NrTVNuThL7ECVQJBQQPpbyp27/cUSKFEMr3d9K
         vJ+Mg0S62nF8nuUBGr7zo6daAN0jwDRaqFQogNB+k99ioLK2tiKry5BAolnhilWZ8Wvk
         Tmyo5+An2hNkJe8wYTEYYAqVvor5COlZ4e0jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242045; x=1794846845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXXU/zrEl8TcSV2xj8OBdFZs1lPljfbXu/prQveYVIU=;
        b=0dVQMQ2LWlf+SSGos52szFzq+wAdbJkHLcSzw0Tq6OJCKP4cHgWnob1dP7z54+nond
         eq2jrSY+YD6T8f35hDCxKSIgH9uF8AeeKcGBdAH9i9XnNAA2lRC7yO8Vxw2/sB9T6Ozb
         hu5TSDT5Es05MUIYr0O/g1ygzOGj0Kmcy262VmibTSh8BSkYqLEuvFa4MYetCsUpr/W8
         LIN6PxiYhcYZ6cl3ExW34xlo+nDzMQ5RnuDYFz3Qx8lhcopthPjUWeiTmMVx3sVv/EL7
         vjH5vSymRHV83AtI8dp9NbK1NK50Cg9u1Qqx91dJG9BA3a8qxsqdYzMwONM9WSf9wxx+
         Ztqg==
X-Forwarded-Encrypted: i=1; AL+hErF/BcuR61YiwBzBS633aY/MXjn9Mv1IJgtw0SEZof9ugIdunmf3Ge6dBeEP2JJydjPI/bH894b/zdfH@lists.linux.dev
X-Gm-Message-State: APuU4Z/sQ6qo3csaf1vHnkrde6YlbhByHLwvstIOgRUKzj+LocL2dnUq
	kRTL7Z6rF9AEBrchyQ8+Qc7a9JN4z0Q5wB5MfQn6lsFcyzQsOIjQ03zHr+jLhmqyQIN1NJw9hDj
	7/6FNopY=
X-Gm-Gg: AYBFou1i6AL/TiQuolPgLByRnLrd3mmfV5BDx1RRQkFU47JLmA0jIDQk210iBK9ywZq
	eXyx4iCpS5Jv2MSxYGMvXXciKtxcqqPKO5MnMixgX7cId8Sr8HSpSOzTlKl91qosu5RL5Muc+zU
	p2l3+dZdRt7Go/XH4puceRLZGzKs70wOVo/QXTmLQZs9hJVNCZHsFqhCYWJ4wMKU2g/u/rhu4nW
	QbkxPiuPsJvL2ORRq9Ns8F0vEHABq3MCw5t0GPlgwpe7YXg9P8bcuc07Ujt9Eb4UviFWxbf3QGl
	NnrlatLa+RJ5KxctYo85i2CMhxKeCH9PeMN6ivDNYkHaC3/WBNrYCL3EkhWESG61pvEGkRl5EFa
	kogDFEsxgQxBa8Ne01Pa/g+k6OkRfLHtRCYKTUjKr+nTMgNwlVC2egJHzOnYJ54xcJaH5RfArCs
	VFQRUsvP3jhjjIhbTSlNvrmUzH17ECO8058TBfMOq6o1v6Ikvd4ifZBVG/VX7ROA77/DNM1un/w
	whE2lPa/zjpzajHqrW2AA+60vu3ImXbhLH8Cn9NEFwoMJLrcdKbc1aBsLddF3GmQbVIOLJTbwwc
	D144OR2aUBPFOSQCIerB5Wq+o4luKiv9hB12q5tlz94OkO+Cticjn5BHX0ZmKVebDiQcPdEtBib
	XSQ==
X-Received: by 2002:a17:906:f5a0:b0:c35:babe:ab44 with SMTP id a640c23a62f3a-c4d6d7c1becmr383757166b.0.1794242044594;
        Mon, 09 Nov 2026 08:34:04 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d68d54070sm188920766b.1.2026.11.09.08.34.04
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:34:04 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2473086a12.0
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 08:34:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIG6SnHjQm3+YwiQeW2YbsKFOCNKwIQU/t3LjOmUdIknY1bUZMpPriJYnN0m7XXU9ja0Ovb0p1zXRP@lists.linux.dev
X-Received: by 2002:a17:907:d23:b0:c4d:4ce1:e2b7 with SMTP id
 a640c23a62f3a-c4d6db81591mr423916266b.34.1794241699892; Mon, 09 Nov 2026
 08:28:19 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-4-kas@kernel.org>
 <f21433af-afc6-4a8f-8d2d-3a377cd3bd6e@kernel.org>
In-Reply-To: <f21433af-afc6-4a8f-8d2d-3a377cd3bd6e@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 08:28:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
X-Gm-Features: AclHuK-PHrKxDKHmHgqeqU9KXvHFHYbJyk2lhNjfjS1J1daidL5w5IKJYicIRls
Message-ID: <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/18] fuse: don't move a folio with PG_rcu_free
 into a fuse file
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 06:46, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> Could we get rid of fuse_try_move_folio() entirely?

Please. That would be great.

              Linus
