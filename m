Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1236D9E0
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886244; cv=pass; b=i5rbJJmSqpH7QOHwvjtN7++FRfYxY8B5jHop8XkGmJ468jQPv5GsCCq2EWATb4qwZAIqahK8mfC3lAb96h5MnxX9J/IU+j19fPCT5RdzGDqNpWWPoVNPpd2GOqfZr8DVXQsSF7R/ZUhRkae2WXkAR7+Fppr9LJloDCgPmf7i4/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886244; c=relaxed/simple;
	bh=fhuwujzJsQ1txOxmh/iVbjDo+gW3V7o1wpkYVb2eB2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHQ0RSU22qtFOpiKEPNnTjY+7wAS2gQ+dAPiP0sKUluosxqgxStO1Hvqan0nJpspn5Xqscc99jTDDWzM8AtTmXExnEvwFQ7KoxHSgJbqhWpsLzBMPUym8bTDmoKtO79AjM+Ncf/IdPEjtT7HePRe3Jkoru8XX49AqdFjj5hPmlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDDjyUpW; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDDjyUpW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d03db7f87so4005320f8f.3
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 12:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776886239; cv=none;
        d=google.com; s=arc-20240605;
        b=DiEvXrZyZC//vv6irU1imwX0lUn/2euP8aDafcXKghwqiQOVpdWMIq3n76aYlJ2nd/
         wRMIhHXLlRU1gDbC5SsK9d/9stWL9641o9eLaldYc1nb3m+IC1TVpTAMJL4d3oTyw24X
         ZWwXhsGL5j5GiBfaMbpaZcp4slimWqxL9lBF2oGc3QGMa3yxCEh+z6FzlNuTWemFcGKo
         kmYuFFytm+cSCDPoa9mHZWkDOv/vbbR0uW2blsv9CIFLAmwBKxOhEpRYMSAc6y2l7yPm
         MBc46EJp2/eFPjCgiL7QmE2RrgqGAvnkfClntAOiThfNN9Jun54LvaTDSDmgOLRWfINS
         FejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aw3yaK4icnRFqcoPcDXx3ykLe9iB5O1jMvtRXhuzNFo=;
        fh=m/d0sfv33Y+8tCka2slijRZgLj2BdMLDLEYTOUbZHew=;
        b=S8k2mHtoHgasiskM+BTLEfkkmZKTPZ3vwesPQKBjkuL8JKSLim7iTeZFkniuO2BwKs
         wmIZjpHOgLw3Xesbk6r3kj0xuZHrSK7HggLnWJRDDSxR0vl52GDh8TEmzmQoZh8z9yiJ
         OVCBXqnyr9KGfAEv9t/Yy4nQPQa/9DTZgEEVCw5rNq2gG/s/EM1+3USwPshxDjAQsPAW
         w29Et2NhRZl0nblHZIMIblpF9252T6/4IWUVp1X8810oWup6D6TRH67LqBkptkmWFibM
         P8grq2AMd8NSBfXguOKwDKdjzuQZ39APShC/55mZE4VzL10ebFXkLdsz4xY6VFcdcQME
         oulQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776886239; x=1777491039; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw3yaK4icnRFqcoPcDXx3ykLe9iB5O1jMvtRXhuzNFo=;
        b=PDDjyUpWfrVk74AZIOEBJ7BFZNgzvyx9J1DUQ2tjCSj1IfyXD9A984VfZvAdcJDxG+
         GY4vb6W7Ifd2mMKzW0l6x1jqFz09jh8QjJz2Ay894ADyDw46VIn/LHXz9iuzX8nS7Yga
         HOwzQx9SRxqoOw27gmJt5eaqgAH3CVrVPROaUKfd7Xw7KiZ2NUQgdkr+Z5b1ZPEKBjqR
         hfRBizYUcR1fR8spffIPuo6/L7CTQQeWDY2/b2khww6U1FD4v7K87X3Zx2rfN7GUuDYI
         Pbs4Qxr0ZljVmlYkctNOU8I1nA8cDSGfRZ2bLBtslaM4/cflmPRuxgpkyK8XPMdV8RKW
         KlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886239; x=1777491039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw3yaK4icnRFqcoPcDXx3ykLe9iB5O1jMvtRXhuzNFo=;
        b=DSpdlG8hBgfAxR6dvv+HQwBEdNL8LZGXWZ/J1M+SfUM+ap/DisfKH4oymZ43MT0fSa
         VXArYVwPQx0jzbNIueCd9iGmQJEpYThga+ymERYCy832mDFMPT9st7PVe7hTjO0fzDQ3
         Dt+O+/vOsargELacTQa393VeRZ+bbh2hU8D/xs75sedYH39Clr4uOeGorXsTLhLI3Wbv
         Nngzn9uFsM0oDwGDHjA5G7UB2bfeaIiQiGao8cOFKdp1o2fQsPiJXbfnyzezMkkICUHm
         C19YR734MvQpBFn52V2VZ1uOKbcvesoBaYBpKETuieG8pe48wMoPwxbKbbgZAO1oPnoF
         ed7g==
X-Gm-Message-State: AOJu0YzAXhCxrSiv6tTF5yap1owysskPHzNrVGFUnmLCIho81uoSVeCw
	RKNPjjxdIFaDwZCrxLg0DxDad4d9WeZ4JVC4vemT8OAICZhthVr6O9r11uo2QItlKviPdDWyISO
	rW7OGBO31SAwhRZsR3zYahlRpcLU8M4Q=
X-Gm-Gg: AeBDietmAdxsNgzK8lGUIRy0+rZCdc0UVwDVoFUVOsSQoSUEqbzgAUVkyL76fOypnXM
	EOTxoW4htFSVyVyxDUtd+WBBx01AHtmHPLvXbqLt4YUlTIhjI5MTW9PSGh8AoBHmGCmXkuWV3YO
	aGBUSixqWLjvDvHp0yvReLHjeAt1Hc4pXLiqB/wBDIkheOsCdO+H6gn2zKg3IY+J4i/9m/L7g9U
	9Ww07sYYPkhjQBJidmhYZ8U3mjptECB/aLyw069Fki0rXPEJMKozqcx14c5ZUEyVKAiV2WxpSZ0
	aImRXe2i1iOl46QpwmvMz/EnWLjwMqo+UQ==
X-Received: by 2002:a5d:6751:0:b0:43e:a69b:d805 with SMTP id
 ffacd0b85a97d-43fe3dfbd18mr23709448f8f.27.1776886238591; Wed, 22 Apr 2026
 12:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091658.462783-1-mszeredi@redhat.com> <20260416091658.462783-32-mszeredi@redhat.com>
In-Reply-To: <20260416091658.462783-32-mszeredi@redhat.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Apr 2026 12:30:26 -0700
X-Gm-Features: AQROBzC4T0OXo8eu49n2bjtCoR4nay2xnC6t3bxqb1p-jTESdmvWeXfGntCMeHY
Message-ID: <CAJnrk1br9Vc_zRgqoBuO-meyPW2=n6p9PKizEiba2oT=+YX+zw@mail.gmail.com>
Subject: Re: [PATCH 31/32] fuse: alloc pqueue before installing fch in fuse_dev
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Li Wang <liwang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 2:21=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Prior to this patchset, fuse_dev (containing fuse_pqueue) was allocated o=
n
> mount.  But now fuse_dev is allocated when opening /dev/fuse, even though
> the queues are not needed at that time.
>
> Delay allocation of the pqueue (4k worth of list_head) just before mounti=
ng
> or cloning a device.
>
> Various distributions (e.g. Debian/Fedora) configure /dev/fuse as world
> writable, so the pqueue allocation should be deferred to a privileged
> operation (mount) to prevent unprivileged userspace from consuming pinned
> kernel memory.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/dev.c        | 75 +++++++++++++++++++++++++++++++++-----------
>  fs/fuse/fuse_dev_i.h |  3 ++
>  2 files changed, 59 insertions(+), 19 deletions(-)
>

Li reported [1] some missing uring side changes

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260422103603.4554-1-liwang@kylinos=
.cn/T/#u
