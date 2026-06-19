Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D62D738A
	for <fuse-devel@lists.linux.dev>; Fri, 19 Jun 2026 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857400; cv=pass; b=HTnBlsYsPzTVBT9lEwWMZuEKbMy416Be80uB16bGgikjZRrz3bWaS+Zp2Qz/mqd5u+opF3W1e3tLsL+EUuYPOreN4y7bB0+zf0ISdOlB9X6U9VuxYo8nTJVpVvNfk96+T7AkXnHTlqaZzvR3Sq1XdXIcTu3J9s4Zs010kzlXK8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857400; c=relaxed/simple;
	bh=p53X8qJeZuXZegtm5nRtHcaV4OUOfxgcS2pvb/a+DVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJpbLKNq/FtBnBppKqaj2vOocKhidjGFwVsOxG1g7/F18g3dSa7/OKLWgZoA1c9VQiigS4ZoOMYh85nFJDq0nYECHoR1qKSjBnVD/adsPUr/K6CDUSD/ej6GsN/mxT8qwDBuNbyDVpEIQRkxEtdZEUZCp1selOpUGxKLNtJ2FFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=dsmBAAlR; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="dsmBAAlR"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-519defad0d9so10166771cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 19 Jun 2026 01:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857399; cv=none;
        d=google.com; s=arc-20240605;
        b=NcAl1W9FZsYNa+6ICsfTMeY8ICPGM8nqzq20vysGlKgXBg2ZcxuBAIgpNxYGREpgvC
         WXrPq0sIjrJ4FEtbAnaINVk58VM2aUr8YcwNWWca62cxom/Rh/it5t/iRdo/c5fCBJPz
         KQaRVAfoXr7Bg7gGrSb8vBCZZMEMgODn44IyEouRwp2Gkn/zMBv1fsKKCuQuxENIT0I5
         uJbaTcdjbtjrJVXG7ihBQpA3f02eaSvLodz2xjaj/dpeqN7QJ5ps/bhZQ55dBD7q50UE
         a7IB2nauQk1RAOCWupdjVKEXV/L9yzUPApbaV+bW6rqmWCRgxNpDblj+qm5h77RYXfBg
         2Leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p53X8qJeZuXZegtm5nRtHcaV4OUOfxgcS2pvb/a+DVA=;
        fh=knyiKQP3T+2y8JixxMzcj7IqJ9nhjbdkAhWZLPBD27g=;
        b=DqwUO+60AxbaFdVXVWb99EgCUl0dxeYfa+hyFj1w2+b1xaufhJXO4Jcj/G+Gw0lLAw
         8dFcy2cVeI6/9+Za/rSd7U7hUfRJpWqNmrvYz2JF0hRYgyZZvZAhoFjtG2+J+2fQ8tqx
         YtQokJQenN4upWMVomm2gbMdLuCb8aARRlXm/EpGonSb76qLRxC71EAKkPGQIw2423DO
         +3Fi80h5kdvmiBsYsbULLNJR0wLou7RmPvS+X0y6xy3MtE9loO/fWFS3gUKNr3Ox645N
         5N3954b+dYZn3MIPGZM6/kw7S1ZlRZiz2mOO65ifgdvapKwyEZXJAb3+6HIYoUG+HHmx
         q6Mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781857399; x=1782462199; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p53X8qJeZuXZegtm5nRtHcaV4OUOfxgcS2pvb/a+DVA=;
        b=dsmBAAlRFS6XB4SwyNKgyNfct2gbAd7TNaokFfEWRxNGYPrP0MJpOAmEu46MIoNIYw
         lTgdscuD8NOq3TJO3INhXNiMVEt/knEL3YooSfu/Q3n3fVJYnfKpmrkib32fD0DtBCD7
         N37VuCUBdppVY8VDDpoSr01zHzsLnvn8Niek8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857399; x=1782462199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p53X8qJeZuXZegtm5nRtHcaV4OUOfxgcS2pvb/a+DVA=;
        b=Lx+M5fn0En7AbOKFzY11LjlC5CDdJ0pqwLvPI38/6w2WvJK2TbUG+mEpHnCEIxvfDM
         QVq2OrlnsOVETMPug7wKW5UnIwvayXXwurpY44Tb56HzCulGjfOMWfOYNpWTxgHlUfqJ
         CH2q0fSsP5eDZW7am/6WgTIbpNbnSDoNHZFxazCQ1pM6f9NxsMi37odJ1jmwv5NGKfIn
         SbmEAUJo/qu5+x3w5arGT4RS/159xjB8JfZsEhscbuxodXtQYeSNJdBx7yVADkky73gC
         bH7I0VfO/r3qxhn0dOAc4ZuDsWgpGhrUeq/z3CC+gTxJ9MsGk+l4qz6X54cZPAC3vnsv
         IQ7A==
X-Forwarded-Encrypted: i=1; AFNElJ+v2m+4Z3+u4UE2IzSl4jBBUhyopTcc900imowCrKi2ETEeLl3VkLkfDDLmMFUPJj/j9afH5DaEmimi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1evTCcv3GBoppt1uvTTA3svQUXvK36bQAZFggPuJZr8OOwWGd
	/DIWWQM5nXZKO/BPPdZgjkOdqnhG8MUzuzt41QomNZp7lDMKIfhNtQiwUJwc09LzQXTXUgzaHe9
	MNhgDis0rt1Z1N+ND2vdM65NLKU+IM/8FMqIsNrcjqQ==
X-Gm-Gg: AfdE7cnSvGmy8cU+djpUJO3qWtgs6IRqVzPBRBQRcKS2EMXj0QRXvQvwz/rFj2xC/o9
	KEfwBhYNMIINXE3Dmxd4uhWxNi5RmyzsHDAvXMeWOYZYCczppBfRnfuNCIbB0XWIiCwlk+f+Nkh
	LQoXMLw7mCwXIuR6IKkKILjL+mynIYqoPhPqEebrFol7D7IU6HZxRu1m7b5uS6hl+NV3onK0P6C
	8XyQLO5NMs7L7jCgDR+VGUJNPtMFvaWHqukObZov1paGvwZEzRBPUbhvfPyV7ZFLtS1sy6sY9+u
	PxkS9KxdadWsLhCpmuVgPFv8bz4=
X-Received: by 2002:a05:622a:d4:b0:519:51af:fecc with SMTP id
 d75a77b69052e-519e4917c10mr37068621cf.10.1781857398695; Fri, 19 Jun 2026
 01:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegsWpKE4kUUQo+NK_cu6oy6h6+A1M=xokvSQbFtZzu9UKQ@mail.gmail.com>
 <CAJnrk1b1nVFZ8dQYA=iGn-p182HNhhRfZEVe-e_ks_daZAU3Rw@mail.gmail.com>
 <CAJfpegvNyqSS2h28-0sB2j2HUoMnKd7StMsPbvNPz67PiS9w9A@mail.gmail.com>
 <CAJnrk1bK-3tpZoeJQKPLjgpQW2F0YQKVhLeGwkN_5tpBVpZ-VQ@mail.gmail.com>
 <CAJfpeguq+LVHoyC7ZzkF_VSAQdqmQFw4DBztiQA1Jfy=U+D9wA@mail.gmail.com>
 <CAJnrk1Yqa0nvXCBo6GzHc2bP_V5+2dHaJn+2pWkumV0QLr0nSw@mail.gmail.com>
 <CAJfpegv=u=jfOqtHXpEC60unrzO7XFeP9o9HM18AVqWfN=O0Ww@mail.gmail.com>
 <CAJnrk1b4r0vbrm_HNe5bV11FVmdKDNAcZzkoLtoW_hEmmBjpdg@mail.gmail.com>
 <CAJnrk1ZVs2hOc7CRAVb_fQPJiUvqK837MzOWQqv4VB9YU8q6mQ@mail.gmail.com>
 <CAJfpegsKX6g5v8jaT0iHhSXJV7SzQs1kKBW=ftnRKU27_oPZ8w@mail.gmail.com> <7a107de6-1cd1-4086-997d-258deb3429ae@bsbernd.com>
In-Reply-To: <7a107de6-1cd1-4086-997d-258deb3429ae@bsbernd.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 19 Jun 2026 10:23:07 +0200
X-Gm-Features: AVVi8CcuAwtmOSyUIPsWKhYcGPAidhDAKBcEfAK8vzN9ZKN_8jtaTzpKW-utRz4
Message-ID: <CAJfpeguvahGpw+Lf0wBHK1hNTSqdprOWwTAKW689cJ6zCVpjyA@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, axboe@kernel.dk, 
	jlayton@kernel.org, libaokun@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 10:10, Bernd Schubert <bernd@bsbernd.com> wrote:

> If queues are treated 1D (per cpu) we end up with limited buf additions
> and possibly queues of different buf sizes.
> If we decide to do queues per CPU and buf, we end up 2D (buf x cpu) and
> search which queue to use gets complex. Maybe I miss something, but it
> sounds weird.

For now, lets just keep it the queues 1D, if it turns out that some
workload needs more queues per CPU then we need to work on a solution
for that.

Thanks,
Miklos
