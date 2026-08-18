Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC64483A0
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046961; cv=pass; b=XI+/vtwLk60DCt4ncVjxkd9r53CyaZ7yaFjY7Xp6wKE4KIlug32dJK/YlGvL+CjTFVFzFTs5xGV8cv8wcY97CB+w+ysIVRYYK9qxDwTOO7AAKNS2092YYKFkSZD7mi2NOghjk2UkMJoHAR3fPln1B5Co9ZFhgtGrCzKmD6Dmv88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046961; c=relaxed/simple;
	bh=oX1AskcHVzP+oNmNrtnd6nQGmqP4hIKnjrZO2RUjGlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQ025uZDjzSBDJCq9uJsxaMrrJdwYWuEgi6akJ/O8RwzzTFYOUsX1xhr+HNFvxccKf7+qJJUhE8FU/7/aYyAaTFGUtaE/J/jKLgcqfilOa2qXasKluaV5SdRIuBq/ijHsxuCoetzzjJV1PuN0gwGKnk14l/KDmnXA9qc88Vl1cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG2jVV2P; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG2jVV2P"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4ab47c40e7eso2934433b6e.3
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 02:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787046958; cv=none;
        d=google.com; s=arc-20260327;
        b=WgPQmQ7dBRConu5acKxRC+4RkyOePuAaAu2Lhqee7eA4j6Kr9tR9A9Goq3E5FjJOhC
         C6kPJ4AIk7tsFdbMxLp4wEc8KfNIpaPe1P+Qk1URNIdE6MrYSPtPZgP7yC6MGL4dcCyq
         RYfuwEARPPS6naQk/vwAAe5wff5NpyPF/quCDVoBlkQ5moUTt6ZZ3MdLh6ceo5FAgbyB
         FFyTacZPAZtepFkU8nW+MC3sRJzdvRTX+m9EaBzFQ16yxmxj17KXttJY+TYccF5ksgmq
         upd8gOuq9K71ynCp1nK79RrTQZFQfxdHs9U5G6AQIsW18QqtqZ70BIu7JAYEU80Kn/Ue
         JfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oX1AskcHVzP+oNmNrtnd6nQGmqP4hIKnjrZO2RUjGlc=;
        fh=A+TMnfGb1Pe82IDGpO9yXBl/RspiEHe9Q6gAHbvEGms=;
        b=DpOQJknwE4WfSkDkQMbNFvGaH3PWo+uBB/oA6HeV7Q8qzW4511kT+FbtvfvwXNnAf/
         4+MuKyrs5h5ixGQQlqWdNrmMfKP4I+S+85vWxeTQLuQskfClTaPBsxQ/vLYtSVDnyMLP
         QNs7kFJtIsQ9mvwzEdWGx7qUp9SJY2JNTMSPqZSSsKhe28lvYnHosB8fmKOb4GR/W+ZT
         KKrIZtd1khgFzdkgsfjLwQZdBsoZat/6M7VPcFB8nSQSsXmr0/WuMV1S7A81OrgeTx+6
         6rRZi46IJVpkBZY9EEma70Tz08+zwyLuAJTbp+bSAeL5q6JZ62tal26LCl4i2DAeuSfb
         d+IQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787046958; x=1787651758; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oX1AskcHVzP+oNmNrtnd6nQGmqP4hIKnjrZO2RUjGlc=;
        b=jG2jVV2P6ftQpQBGZsPRbVX6TTsQvoTHuQdcbNl5xDNj71AfG0Uzae5OMKhK33V+k4
         wq3ZVR976WNhm3VKKRCAsQMR2ZWz5RyM46u3TkI+K/riB7XJP+NRfRpcoi9ZWvwzFjpW
         zIh+D0HFQVgMS077y//zabU8NLf610FnKf+ZZnSQUBhBHZQdcUT4IuFKOHf5fNzIYwMo
         k3+L2t+vwBzSHT0wIpTY6MEIQLEdjQn81mczlti2RLQXln6L8Gdqq4EUDlMi3IFWwe05
         Qm4rU1V2IN9irOdJh5/GeFYIunbQ8z8gYCNPi5zh4YPb2i1sZfJHz4X41DmqZS84BUyQ
         JoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046958; x=1787651758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX1AskcHVzP+oNmNrtnd6nQGmqP4hIKnjrZO2RUjGlc=;
        b=tPeqF3hLgZ4PCAUSIDkBwoollWzhJPALOwwKXn2B/2evh7RKNn1kx33P6TY72hD3T9
         6GUyCS78oRipy7izTKCNAgcLusqwd7t+7Keq3xiaIzSk5Q3EGfg+AzgTPiVwa9xs2szo
         aMTi8HnfTbp5zoTuavDycN/O8/xeTUI1uoq7DyhoroGOayfSFYENj5uYVjVu28gvlppJ
         b1JA4CRP6K61DIAY5fVaKIf9UASoisQBzFVwqy50qM5xImIJPIKVq5A5M0zYksXo69HK
         +qtqEkoFR2wC/6yCMcyFIr2kVTQYeJzav8AiPSrkmJ5hrT7DrjKuCdx+4//rwzcsHNHW
         wPjQ==
X-Forwarded-Encrypted: i=1; AHgh+RraGJe8oMSezGERNHz3L5k0BqQAdwbrx9FikvtIwWapCMhjlNK8/ggX0t5bbsZlxqstkzD6y53ZCqNs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0MDbHn9jdpiMZcxDd6/w+n57FfXNTaPdPym2d4Be83HOVNLAR
	QFrHqkhF7pnn0RZnqYVAuF4u5cBMjld64IDawB65cjnpf2HUuLi0sJjQY9dX6jcJ06gHo/zUFDr
	8WGqhdmWDpo+H3aZkGv6PgL2+dcp+4qw=
X-Gm-Gg: AR+sD118r/rhvLkvIXR1waeZ3J32zdvjHN61QXJrgXYfy9ZYcFrgT0MRQHYJKrTaH2Z
	7SJH0+zvguKDa8ZmS0bqBMryvSvE5iw8Ej4Jhhg5bS36/wWn5efKFDI/ntMXSUw1/y/pl0Mck8k
	bMbIhVbUR2OzNB52EFrqVtX+QSpS+eStJ8Jjv3zgprWes6zfucFoe2Ikg2vLzkx+l01G+FGhYUC
	w1tDeGsFLtWW7E+r0Qr6WpcdZ/+EQsfoP/4zymfL8Uvp6q4qL4j0C/wZqnD3zkR+Mzl1d7NKOgS
	smUUUeyZ7h639zS8LN9qxSQ0+LT95hXtc5vULr3zv/w=
X-Received: by 2002:a05:6808:c2fa:b0:4b2:8d89:6a40 with SMTP id
 5614622812f47-4b2975bc6a4mr7019732b6e.7.1787046958156; Tue, 18 Aug 2026
 02:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804091757.503476-1-junvyyang@tencent.com>
 <20260804091757.503476-2-junvyyang@tencent.com> <CAJfpegt=OFdZ6mhesKOhpf_AHNM0f=rATsMsvmqTzuovAvGJDA@mail.gmail.com>
In-Reply-To: <CAJfpegt=OFdZ6mhesKOhpf_AHNM0f=rATsMsvmqTzuovAvGJDA@mail.gmail.com>
From: Yizhou Tang <tangyeechou@gmail.com>
Date: Tue, 18 Aug 2026 17:55:46 +0800
X-Gm-Features: AcwNN1UCCOZVXFdpXv3N3qordRsX9UeGY_jCVlPzTDyhuvq5xEoGFRsGEk4qb7I
Message-ID: <CAOB9oOYwBcVjpGsThQ1aUPap5vrOhQFrpKL6NW_sOXBKvN=6Ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: set FR_PENDING under fiq->lock in fuse_chan_resend()
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jun Yang <littleddfu@gmail.com>, fuse-devel@lists.linux.dev, 
	Zhao Chen <winters.zc@antgroup.com>, linux-kernel@vger.kernel.org, 
	Jun Yang <junvyyang@tencent.com>, stable@kernel.org, 
	TencentOS Corvus AI <corvus@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 4:41=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 4 Aug 2026 at 11:18, Jun Yang <littleddfu@gmail.com> wrote:
>
> > Publish FR_PENDING under fiq->lock, immediately before the splice that
> > actually puts the requests on fiq->pending, and fold the intr_entry cle=
anup
> > into the same locked walk. A waiter that arrives while the requests are
> > still on the stack now sees FR_PENDING clear, so fuse_remove_pending_re=
q()
> > returns false and it falls through to wait_event(FR_FINISHED) -- the sa=
me
> > handling a request already handed to userspace gets. The !fiq->connecte=
d
> > path no longer needs to clear the bit, because it was never set.
>
> Thanks for the report and patch.
>
> Commit ed9c881f3b49 ("fuse: fix race between interrupt and resend")
> found in git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
> #for-next contains a very similar fix.

Hi Miklos,

Thanks for your response.
I agree with your patch and have already started testing it.

Best regards,
Yi

>
> Thanks,
> Miklos
>
