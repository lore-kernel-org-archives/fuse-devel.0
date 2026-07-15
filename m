Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3E4A13B9
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137909; cv=pass; b=KR7P8VzF2MYIi3qGo9fnRGOOrypC1PwG7Qd+F/J+7LFeQGOJVn+E5DHtvnyRyW8Lr2niSFZJtMtbEOuGz9LkXzjN7RjnZMMtmRW1oF1Jj2+scWXvpeoMU66G/ZYsQkhM05/FhXBX86ELhuvP0zwJRpM02zt2umjUv7zwvZcVF+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137909; c=relaxed/simple;
	bh=DU6lIIGiAmL3vAHbSfUlkC/knXl8i9oP0EzDpJow4Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXvDzgS3n2ioScYXyTwU1Iz5Afel4ZDPrOuhrya2IQBQcs3pwANs1jWVLrHYIe3EgbBhs5zRlKITPpB70g7mr/veKjY9dGj/anzT91unpk3xWMfbBzdrILdYR3S1eFr7+J1/dAsr9ehO7v//6tY2vnNbjJYnQ6/5Xou2SpaxU54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEKYHC6C; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEKYHC6C"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1876508f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 10:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784137906; cv=none;
        d=google.com; s=arc-20260327;
        b=IqIKR36u42QMZT6Js/e/yWOsKukja8PlJYQiFkAgjjFdgWxhvFYZrRKXvYhkyy3S6P
         2Xv5aE/QAZlGTNKNDQAwq9ziUarrSmmT4wrW5ud+kIoW1iYTbkAt0e6LrKHBuAzV/V0S
         mNwDd8iex8FySelTn2H8dDgy3VIEiBXJxp3orznGTRjmFDs1eb2dhmDEmvCgLz5H0+oK
         OT2B1BqTDm4S6gtzVb9rT/s1oDnmt0T6XdDCvTuOV+SLEwKA0Mxmbh1qETs1K7Q5yQl2
         tAIHBoTIND24RzgPs1Eua9b8iHvPbLn0FbkEH5rWzdsH7ysLBMJ34Vj2BNT+O619CtrU
         yZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DU6lIIGiAmL3vAHbSfUlkC/knXl8i9oP0EzDpJow4Yo=;
        fh=l7HR2UoqST9bp+1uw0MHejaRu/I/QYh1wrMwqbvenHA=;
        b=bLzM4PzcYxuz92REnJu6Z8zQVb1GYOH3z8s4lFHkFtOdXJ2v4PDc52hQY8hCMT+oek
         0NsaI3uWKj7ArIfXON3cNcCM30DI29kvD92B9VCrnBcKsHtHGpH6ieGG2Zxrppw2roMN
         f5fr3wwhe/tGEesCwsSwNNaoKlX73hlV/jrTkxeAFtG7a4Ben/Z2mlhcRn1AEQ+00Ez2
         ycPULk+9t9BmCDosrs85GW2ce2c4wGZhvHqBmVOcsymu8ToQNewKqCXKBBEQRoGn7rnR
         JZ74JjTNQzupxztbEQMWAGjo+8javPvRqsUfPCKTxHxTeZQa3dfmYfIork5mFqxtEDHB
         J+IQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784137906; x=1784742706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DU6lIIGiAmL3vAHbSfUlkC/knXl8i9oP0EzDpJow4Yo=;
        b=pEKYHC6ChfyLhVZD+x9ZYHt2RMZ9JDQeFW7WY91j3F2SXItJH+vyfwH93knOFggjSY
         jNmcdNQd/xNRcJ4QOIIm2sdsUVC3SEekhcMarQKCJ64TQDMsr+og1Uc6gkNrncc5jxEr
         2wiyIMuYnF52Vnhd9cZ3CtWV1hjQBo1Gj+lmhFRBclGgU0S6fGH2///JKoLepr3yxHUa
         BMoJLisoaQCBan4JOXhMEtb9A/Gg4s0SEMVoXuxxRl5ODL2vZJ24zJuTf6GbnWO2gCOc
         21gEqOFiX+eRm4RQva6wvm8/OeVGiGe6WJ+Xi1wPb3J1QKar5juNgqchC+EnAC5QkPkG
         Iyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784137906; x=1784742706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DU6lIIGiAmL3vAHbSfUlkC/knXl8i9oP0EzDpJow4Yo=;
        b=fhpl4UFwqmE3sPD6q7BLlhUgkFnwIvygjw7HIxqix6lLKoTWzWifbvqKnKT8zN41tZ
         2rQ/Oyq+U89jWb2r0ocg82TLfnkz0zB8wvJNrHm5Si5qnJqmdUHVE7TaKDKGjbtkTfmx
         XOG80TOXvd1rJTuhmxJlY4EJMU3K+5kYkAz9lh+Y8Au5DWWqjJT6jIv/X6kt/H7+28SM
         UJptwEwT3qFr/iThxnCvgHvFqlW07I6UiCtwuF/e6bNmZK5eBRS6SumkUokCdzswgJNM
         p4ypyxGM/PTP8byQD8u18z51H3y49sI+cSVwi5VvcOI7hwAdBLXvgofBB0aU0nU3SBfh
         YEFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9ZL3miXsu9kLUbW7IzlJzywer9lKb30va/uaX4wYFL9uwRtSzHPvLK6fPCmiLu2qeRCd6BcSeEBtj@lists.linux.dev
X-Gm-Message-State: AOJu0YyNl5CFgi0ljUp18ZuG+DgTl5b8/1/VFNt5E9IBB8rsrwh8/fUg
	b8qzfGmDifrCYhfCkICKzCrSmBrCLvgYaHF/HxZg5xmWAJDG/9Gl+yTc/+D0TeJC60iqVD2eHFI
	Wz2/+eWIsL9NNnfBrAsd44e3cgRlUVcbjJnEqlBs=
X-Gm-Gg: AfdE7clro3wxBeTzFEPlNddk/p7mHD/1iqctwqUWxUhlzrVcSN4Uoo5Pt8oHIlTLCVn
	51D1HnCoz2PuYWQCg2nOM6EHLOPzSt85IcD7sws3djZDlfNDlP9IJPe8aoaUiOcy29gg6us2LL3
	Ht17l14RywmoSJqHac1Z8ltacUCfnoqzU41cGGBurYXflpTr/3+pS8B680emy36h2NtkiLQ9FYQ
	+qdpBGuGwCPBDG5SZj8r3guM/1cCPY8XtgscGQMQ7Won8llEMmJn6YKBPR68v+MOm9tqCmaSnE2
	mA/JqsieyAYjap8DSEIS8PsQbN7Em3BfSdoe1rrNWDwSoAwrpWaN
X-Received: by 2002:a5d:5f53:0:b0:472:1424:fc7c with SMTP id
 ffacd0b85a97d-47f55ee9da5mr478466f8f.10.1784137906052; Wed, 15 Jul 2026
 10:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714073230.4324-1-liwang@kylinos.cn>
In-Reply-To: <20260714073230.4324-1-liwang@kylinos.cn>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 15 Jul 2026 10:51:34 -0700
X-Gm-Features: AUfX_mxBCrYH3SWRPEpomKoHZuZ-9fFN3rytuVNZOII2RvIGvdwYcVXmSeGcPQw
Message-ID: <CAJnrk1ZGVFJykTmtLr2jbxtvrJqq1P+-T3LgHsyrUQPj5wFxLQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: select alternative io_uring queue if local queue is full
To: Li Wang <liwang@kylinos.cn>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jinxu Du <dujinxiu@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 12:33=E2=80=AFAM Li Wang <liwang@kylinos.cn> wrote:
>
> fuse_uring_task_to_queue() always maps requests to the queue for
> task_cpu(current). A single-threaded submitter with high queue depth
> could leave other per-CPU queues idle while one queue handles all
> traffic.
>
> Prefer the local queue when it has available ring entries. If the local
> queue is full, try other queues on the same NUMA node before falling
> back to use the local queue.

Hi Li,

I think this is already covered by Bernd's changes in his reduced
queues patchset [1].

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260529-reduced-nr-ring-queues_3-v5=
-0-1dc08c2fccf6@bsbernd.com/
