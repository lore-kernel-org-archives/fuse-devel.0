Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7DD35E93E
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 23:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269173; cv=pass; b=tbid1+f3ECp6rhHWdiX+cEgVK+K5V68bfR0qWBifcM6Diry8xURIDh2NzWhix1lan326UJBPpmhg4hUmfhZe0Rt9x1vcdW7uHTGtefHt6liXwhr68wEXb/KIBLRmSGMcoeWbC6uxr+OpS4XzxX7cw03cLbwCXNuOLpdoeyVQJJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269173; c=relaxed/simple;
	bh=uakSqtDmfHirt56Ih9c2dlFS7k35p9i6DyOchGy5ecg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a76HnTPQfL2kVugmHiaWncQlKeu5dvjCBPGns3yI+yxTApiBUgSCj9+QsmkdTUqDkU1H3Xnc3FFoO+xlpLGS+xm54Hk2At18Po/EYHdZvkbOePdX+v4qg+XsRjTWzNTR1YN/dVc48UX6YfbAe8KzeolTt/FebKqRsKqZ3CXkdOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCHhdof3; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCHhdof3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so2889325e9.2
        for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 16:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787269170; cv=none;
        d=google.com; s=arc-20260327;
        b=o9H28rTiH+Zvp4sPRnQizn9wU/N3WsWLzdXrSNmPVL3VxD2pMDehFKanHuMIJkW7zr
         W8Cf6XMIjHrocIm15wOGBU5tgv6LEoiJ2F1J2fqbPuBFrdwGNb9DfioyFtPqeN64fWMo
         L6vYwdHXGK3y/UgNPFQWe/k/3ljomo6guYaxVgMiHxxNvBG8TtA6xjpF5f4qz40OHGuQ
         VbIUvYJdmFGij1V1DTlrTDc0lmO7RdorVqCjiGBjNAIeQ+m09/6vEBEyGjFPTawerRUA
         ZeXzmN0qn7NLuQofvpk7kAJV5zcr16D89XwqpfH6TgpoLQo4PdgegA1GYBnCYnByujKH
         1/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6FWGDnWimdEuyVbIhKTlp9NOezQCpG6klu9pcGU95pc=;
        fh=PVyddzk5pbGGdmNUS9RObzEEajpAeQhyVTS4Cvgz4Ao=;
        b=pp+wFQQQZk//OlSP2vGdlEeDgklslQSK6wtolEELS1c6JxjYC7otjZRooScFT8qea+
         KXPdjjeXS4Xj4ivimE49D0Imsj8bGq8EdvmdgkSwFJ6k3eQcqKZNs/5xiOIm5rIIdqxg
         QGxCnyL0MF3hsMfPhWwyhTXBsbqd71WmTfDksx/yj7wGvm0Kbl9UBdAoB8Bcxtjx/D88
         9flWau60jacqBg5CCalkLAOBCteOiwglwucDdvrT9L26FAH4uUnC1/dqHurTfI4eb0eG
         8p/yj/z3KgBfLqZ/UJs/FIv3Ylk/ZTGdpYy9Idw693PFMMfpdmWygmzJB4V/bwWzM88w
         bwiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787269170; x=1787873970; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FWGDnWimdEuyVbIhKTlp9NOezQCpG6klu9pcGU95pc=;
        b=kCHhdof3LMb0BvzLioJmNHmPbCSlAaOFOJA1W77HWCDhQ6LFZEq8s1v0sPzK+wuK4y
         al7rixYBJtINWImCdG0m6sZUyAlypFWnxiYnUEld4IjI031/iosEbVHTy4QOiA8vIrtj
         K6p21+9+fRYvS+dZL1WkkntKmaF0O/N17xkGo6UrAMGno3xw63LOvSu6jyBX8vDdNDbO
         ++zh6JX70NVvw/FsqZU6LxFGU8HcXLKJp+ZXgPRsXigaSllpXU0Bs7dRqhJ03mouw49p
         UILZbjlTJp2LDsdihvWHOerC5+LgrzgaWfzZN9yD6KApj+JhIn8y/JvV3gu1Im+7Utgu
         pPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269170; x=1787873970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FWGDnWimdEuyVbIhKTlp9NOezQCpG6klu9pcGU95pc=;
        b=mVngotEKMV4LnlGDJsHKXE04LA9WXzpfm2I9w/TtFrFk5hsTn5lyZ7Yoz3eYNdWhK1
         gvNXrrhjvY30lCSNIWdqqpxAeQ98m42ru53bb55xwF/77aR1McWoM0i7cePHMYCn5vjq
         QgkAEvvpXRgbuav25CVnCsj6ZcadE4lJf32QHk4+6gTxJNYhpFtmTFLXKxuaFm/+c0Z/
         hyMKGJQsxNPWpNqc2wFekxooUCQD9hmQqpcjUEwbGJ40czN9aYh9CFvH6bQix0EehgoW
         f3f0jmyDzDAm0XSOewmvcWS3wynLRz7/WqCjbR7V5E5JpknQNh9xpwweMZSc6yvdDBLM
         LVTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIRg38wqpmPKyR3yJiDX4BYqiHF+gYClzstu7uCwTLH/jCpkBsRgIk9vDj/osY0foFKJfToF+KfCdY@lists.linux.dev
X-Gm-Message-State: AOJu0YwZXCyepD/xule5pniehqZpOeSErOofkcwG1W+9pzcSi5/SRAQf
	O2RIV4TCsyzjqYWCvAgfczZF1QbtNbbaKleYuFFFzJtxRrShKpnP7PGkK2RS+GPB0dpumU0f+8w
	PvtCABq2oFRFhhSuX59+6QMpbq0afGPc=
X-Gm-Gg: AR+sD12oZWlrKso+OqZwU0fLy0S3dR4+M8XQtJY48cfz09goM/1eaK8lcx6Jhw/bceT
	VRhoSVYFLcQ7TSmIE1uwOXIonJ0hm/IZWziiVOu9F3h8qdVWotYOm3eUu5pTAGG3ZO9mFY4R7sn
	no6vL8aq8fcYmebf4DqkTWHur6sbbSfJuVE5lPmr2Xf4OzXuqDbpuV9634n8Tjr/v/tHRBiWlxi
	pt4Ur5o4EAM/zjyQ4oa9oIRYsoXTTRtKctHaC/9JlqSF7Ip3982fALcX6xHkR+o3TGC7Q0dxMdV
	SeUFOzXzJzbxIg42+upeEajTsUF3waN4yMByBT9jXlG5YuC2SWXN2ReJ18vpPAU9mj40SX1nxiM
	0PjV8BT5g1I1Povfm80GCnxCQ
X-Received: by 2002:a05:600c:3588:b0:496:c18c:f9a3 with SMTP id
 5b1f17b1804b1-499b83184eamr33065975e9.5.1787269170200; Thu, 20 Aug 2026
 16:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1bk66ZhRAS7mojSnD5RBfFS+0ChAPymE3ObRWr0C_udWg@mail.gmail.com>
 <CAO9r8zPpe6fWOSXtRUjFB8WNMroeBqvLT+2QtAU4E27AtLUXMQ@mail.gmail.com>
 <CAJnrk1YifN22mA5PFRVrh3m_ygxax6x4_8nraG2hPqCzyzBj7A@mail.gmail.com>
 <anpsLy_pCanocgS1@google.com> <CAJnrk1Yoj7fqbzurmHkbA-vegpQu3cf-_dfvKor_VxuNhPR-AA@mail.gmail.com>
 <CAO9r8zPLipVW6bvyDK1ypSawbo=LHKvmLqWH0xA6WMR9GYNJpg@mail.gmail.com>
In-Reply-To: <CAO9r8zPLipVW6bvyDK1ypSawbo=LHKvmLqWH0xA6WMR9GYNJpg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 20 Aug 2026 16:39:17 -0700
X-Gm-Features: AcwNN1W2WwOZ6oRwPRAG9dZBaGHXMlGuhp9w5dO0dP8YLHD19Z4QrM5cxrAENkE
Message-ID: <CAJnrk1ai-TqcudPoK-qFRYAJnUjBmg1kVa6Vxg3eDm5w5ivqSA@mail.gmail.com>
Subject: Re: memcg stats flushing (WAS "Re: [PATCH] fuse: disable default bdi strictlimiting")
To: Yosry Ahmed <yosry@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jingbo Xu <jefflexu@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	linux-mm <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Yunzhao Li <yunzhao@cloudflare.com>, Song Hu <husong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:40=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Wed, Aug 12, 2026 at 1:59=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > d) vmscan (prepare_scan_control()): for determining whether reclaim
> > can deactivate, there's this logic
> >
> >                 /*
> >                  * When refaults are being observed, it means a new
> >                  * workingset is being established. Deactivate to get
> >                  * rid of any stale active pages quickly.
> >                  */
> >                 refaults =3D lruvec_page_state(target_lruvec,
> >                                 WORKINGSET_ACTIVATE_ANON);
> >                 if (refaults !=3D target_lruvec->refaults[WORKINGSET_AN=
ON] ||
> >                         inactive_is_low(target_lruvec, LRU_INACTIVE_ANO=
N))
> >                         sc->may_deactivate |=3D DEACTIVATE_ANON;
> >                 else
> >                         sc->may_deactivate &=3D ~DEACTIVATE_ANON;
> >
> > (and same for DEACTIVATE_FILE for file-backed folios)
> >
> > target_lruvec->refaults[] gets set at the end of the reclaim pass. It
> > stores the same lruvec_page_state() value that prepare_scan_control()
> > will read at the start of the next reclaim pass, which means if
> > reclaim passes happen more frequently than the 2s flushes (eg under
> > sustained/heavy memory pressure), this logic will incorrectly assume
> > no refaults occurred and deactivation is disabled, which afaict means
> > folios won't be moved from the active -> inactive list, and reclaim
> > will start evicting pages from the inactive list that are hot (eg more
> > refaults).
> >
> > This is from reading the code rather than a reproducer though, so I
> > don't know how much this matters in practice. Unlike for the writeback
> > case, I don't think flushign more frequently solves the problem. It
> > would shrink the staleness window but not eliminate it. Maybe one
> > solution is to keep the deactivation state for a period of time if
> > refaults were observed.
>
> We do have an internal test that runs a VM under memory pressure and
> we started observing OOM kills after the ratelimited flush was added
> in vmscan, so I think it's more problematic than just reclaiming hot
> memory, but I didn't look too closely.
>

Would you be able to share the test you're using? I've been trying to
repro it locally without much luck.

Thanks,
Joanne
