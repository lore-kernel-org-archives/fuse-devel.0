Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795517756;
	b=RXSVpUlKDcjEZsqn1QrduqN/3bbkcjc+mcOD9GMjr8Bhhp63jYjDLXHYp2l3na2tQx7k
	 ueSvINo3lmP91h/eZoZgYm9VFALZRhtK+vNP4uttJygIYyZe+7Cwb1uYcrbO52USYXHXt
	 eHfXwYpTFaHY+SOmfGzf7G6RNaGAACdFwZR4iuKIAk9DMIJTrt3vaUim6Yl1AjSeJA/M6
	 25ErFBvB173YPtYTYnqdio5u6okduVaY+MLNMpbxLtp7dHTbN7UCerBPJMwXtA6tssfC/
	 nfOpZ1VcJg/9aHnOoBma1yx38ba9F6EqbKEvQ1AHTzLC/nNB1XECr7Rblf1Vsiko4Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
	b=IbYr05tjLEZN314+Qqdz/MFrkvA3joNVsxBC6+orVZVchWW/CiaQr2Y57Y8ltjn0yJRF
	 hEM/ORWVarqdjURCxd7PoK3CF3jlkt/466R83QTbAxZ8Q8PZUFt0I1WXRGpXpMxPLM5I9
	 eMRQ0Oe9FiJje/NeWFFNGu5ts8W08GQd0mzZr1AqJG5g1y9o5LUfyg2pg1OslKHp6uT0l
	 7hlncXWZJyd2QdozOOvqoAsnqLTJx8rpkiN/QR6rqDgscItt3h2jvJTjfPF/66AcW2+EU
	 ewsiqSF/8VFnrUT2pXKLdqIOQPo6az+o4rd33NMLpGlyPK2UBnfMeZ1wdiCqD7i/bhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=aHyUg010;
	arc=fail smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42123606A33C
	for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 10:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42123606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=aHyUg010
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55c304f7031so57368931cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 24 Nov 2026 02:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795517754; cv=none;
        d=google.com; s=arc-20260327;
        b=DM/8FRzH+Du0fIMuSRRexQGRP5JUBkKg5SYSvkVxE/R+igCgN9eWqeNsugtx4OFQ6l
         WhDz/4zjp25lCCiCyiaQ+QGrQy1W7AWyl4P+x62snC35awSCAcFHQZCtc7hO1k0uVOWC
         sMhUuShe2T625dEpOk1GqILxqxGNFGgKsSWzega7sUKFNhwug3QBKtLXiAH7u7rCNGKm
         /0IgBGoLw/Sz9nBo/Odf8iyO2H9VOatXwzJDZYpXrvfrDJnqwoSpSCuRJU3caaWAYI/2
         NJZMhOfsOB3bdAM8DzNZYgL4BhLVSUIiGzdeok209T9aHg9duFcX5mgwGvCY9tAK35GR
         lA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
        fh=V5hBmoAmzyXMTisXd+pyu8SwwLvn/O+TSo2e/VPEGqI=;
        b=IZlI9DoC2own02+/8Zyu4RvJw4V47Tw1UagHdVw6RZwCXr7pn/48rVyGai7fO/VXgw
         PN4227w1b8XPNk8hoJ/ORWevY7U5TI8fWGHkho5TGePY0xxI1HLe56Lrpe3CE1TMeCUP
         dJCYqQMjCPJyzT0oJkPNyXHbTAUdVkV7a7Cxf5Uwi/zounlv0XHLApJvwGgdhn3NpuVw
         jVQyG4mIgajMH573zZlWaNfrZDAhwH7u2d50i0SyYTydxmFA494tCc+ZUutAdAAQIHb5
         xmbc8lFeyI4m+UAuo+PuA1sm/lv/Ds1DNRMuQDT+nPTW/CLVhQcp5x2670n9pMkyDMPb
         LOdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795517754; x=1796122554; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
        b=aHyUg010Fpa30tqfBUn1Gih+DTOzaKalA8zN1XBuoXqQay7t9Nf0/FQfF7TKBld6Na
         H+oZLrT9EDYL/2VEaZ6JqGj/vg4ixQZUUDwvM+f8N57hPXmm5vlgshvUvsJyk5JKHf6B
         iEel12hsckPmiRCfJSNtL4IHY5Bc7QyOmEMdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517754; x=1796122554;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f7K+OWT5/zN97AWFOPBzuexi2dmP1ajwM95QsLerSkw=;
        b=Y39H6YpkXmD0O3eOLBzBUhMTxqIXByKjm7zB3xOSPftseSSPK8Y1w4NTIF+237OWBI
         miV8MzWpK42EnPnBVHXacOI+FhtxDvWwI/md4PuGQ1ZL92zAydKeATjywCi0OrUHplfd
         m5pe7Y1HAUcXHLcLfxBini+SEKmFRjjOnyicCP69oldhLUWIoANFBEcb+I/rjpHXnGh6
         lErO06YvzV3efl9nsR8Vw4nWoAF2INGPtagmVKYFHmjlzG/+P7D69+hd3Cyr9nzs1PWE
         Y+qOVyBg3HAPMRZeqyKhUVw+YXkUpd+ZYKxjf1DH9fn3GGNSVBaUxeITViIkJ0iPVqtQ
         BiZg==
X-Forwarded-Encrypted: i=1; AL+hErGqlJz7mzPYVpvIXKbg8mMwa7X7GXapJnbc6p2yGlbLmP403x08vDrBRu8alM/Vv7IVnmU1MYXZvce+@lists.linux.dev
X-Gm-Message-State: APuU4Z9Vr+soQ0UgjUqeiQEsW+9ArtiGPr9K9GkGzQtPR/ysw4POjUJg
	AQ6XmfNcufR32lfdHpefyINeZcc4YZQ2H1CHh3IRqbGGsU27gc4Zw69GeOcEJv0zf3rN2WbxYxl
	ek0RfA0LHwnd1gcbIrMamgLMjxNzNKfv/mNB45xGj6A==
X-Gm-Gg: AZFdTZc05FZEgzxgqXYMwc/y5yOWk0BEcJujLgE98DUE+9sSkFELndW3Sp/mi6ylEQx
	5LH/ffgl/51Udhi24eck7ZbCHYXEjVAiMuHvcrXn9l8L4uIAdy0ZfbEmOirpbNIK9+AxACFbEAw
	QowUAQz9GAyHyhja61wvfzN7DhCmoOCtZDaQgmEb640pfnQL/GOnN0kVppP+Rs7bolrJ1jfZZH/
	4Kdr7XJxopzAN0L5p/SrF5NbEVOpYBgi/BUh5w4guYbnvb6s8qkGhrg38aIVChK6c3dZgfEo9FD
	zAiEL8hDwW0TgAZvpCyPmszpw1GaAlPkulYUiqA2WQ183Fiv8WKOkN1hRjhOKNCsmO4Lci9Ua9f
	BlZek35dxMOHuN5cFlINy26x2yJQojGxgrwsjrUdFf49Ek0J7RclD4LxuTXEpfozkww==
X-Received: by 2002:ac8:5d04:0:b0:54f:50e7:6d69 with SMTP id
 d75a77b69052e-55d6fbfc728mr265521821cf.1.1795517753910; Tue, 24 Nov 2026
 02:55:53 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <6c6cea56-1af2-4a37-b081-83244d5e09cd@kylinos.cn> <20261123063609.82014-1-q.h.hack.winter@gmail.com>
In-Reply-To: <20261123063609.82014-1-q.h.hack.winter@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 24 Nov 2026 11:55:42 +0100
X-Gm-Features: Aa3M54r7eAE856Qdq3AsqWMUaoTcqR2q2T6lCT40Ts3802VL14VNSmjueVArc1E
Message-ID: <CAJfpeguspTb0w7DK8-4ALHMcHbH0+Qs8nfh78mOJRwN3VQcAdg@mail.gmail.com>
Subject: Re: [PATCH v5] fuse: virtio-fs: fix lost wakeup on a full virtqueue
To: Qihang <q.h.hack.winter@gmail.com>
Cc: Li Wang <liwang@kylinos.cn>, German Maglione <gmaglione@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, virtio-fs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 07:36, Qihang <q.h.hack.winter@gmail.com> wrote:

> On -ENOSPC, add the request to queued_reqs before releasing fsvq->lock,
> as send_forget_request() does.  This prevents
> virtio_fs_requests_done_work() from checking queued_reqs between the
> failed submission and the insertion.  Both callers can then return
> immediately on -ENOSPC.

Applied, thanks.

Miklos
