Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C33FFFBE
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091607; cv=pass; b=TVZpIgLpm2K9tCSMUu2/4W0yNJFJ4e/CDHIO01nS5jtIWXqZxlLBiZ0JNsYTJu6QYj0XP0awfrPTJ3CV9/rwCnN77Tt07X3DIc5RcabxxSS6v59KaZOI8/B8VSkhmXbVg4XX4j0I+k7Mhgc+FjQZA0HuEXsw+cAg5BhO6Do+O+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091607; c=relaxed/simple;
	bh=yyiU0NtYK5b/84vtGjMWXa0WSsmy0Dy+Aq8xOK+m4D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HG5p6QML8j/p2TD5fz65OC0daj+eRT0wZVSmzn8IRy/Oj14IbSppIhjU9mLYHFC6ZPhMcUD5H9OV/LxYZG8YFw4kBySsjiVtuPk5+E7/isxCzzj7h2IdZHp7e01w5tuxj2i4KCMZj6NpTJ8KPihTa9wjyd40koZFezSmx0L/T+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=mxyN6y4q; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="mxyN6y4q"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5177b1a7441so93318801cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 04:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781091603; cv=none;
        d=google.com; s=arc-20240605;
        b=F7+PYEVrhbULIEsdmRBdYusprKWQqIfrkGunSlzqNhkYwple8n0e/O0wOEkCnXQbMP
         702VwL6yeHgz8tJnO+SwskVoJ1JCluBVYskFMonNePKwhcVXR1bJilYJX2JNpGm9rar5
         kPFgdmxVLnLKCUF9/GkSaKa8XDyjM669ZGDbmr58XtRCcZK9nF75oXkNdZut4GXJvude
         pJo6G6fMD+SsiVDZoVfBPy7zxrbE0yAaEvKmUFjy8w3iwt19wUX9E5kKqsgv53Jko4Nr
         GJ8qEs+x9HEpsN88yYHQgAKdzolVxaFzceX9w8bBAkQT/ieMTdTYc6qAPznd5MrJCK7N
         g5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yyiU0NtYK5b/84vtGjMWXa0WSsmy0Dy+Aq8xOK+m4D0=;
        fh=NY2fhN6GgXL2GVneN3ufHxyzhZxw12Duer/vWSGMcxA=;
        b=QoostFeluTsrjNs+ss4ZIbnWAdlOO6V5WyGTv7OeVnc8YL/y74SuEKNq8yL8+ZELDy
         WWlJfUuOYrGZsNJSi0AYQRpgOvfIQgXs2KOSMBCPDNCSeV5g2PnzYaP2L/2N4gcUtZAM
         C+TDdL8Th2yvmGXThSm/M6Fm9CsLUMdZ5Rf+YfE7hTidEm5IKdKKJ9vRAocnZ97UPEXM
         n25SGhA0RDPfitxQfEudJ22wimr0ylMkBe6bFWMXPERZ7GR71kKodO8tj0dpgdi5nhC2
         BnT1zDqA3o0BIAD9eL2prEj3i2GAWiXLVleMqVjA4LD9mMzU5ZyhhjnpQ2WRm/l0T/Lz
         amqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781091603; x=1781696403; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yyiU0NtYK5b/84vtGjMWXa0WSsmy0Dy+Aq8xOK+m4D0=;
        b=mxyN6y4qV4+pcUBkwvNxrfKOwDyAdF/3eTvGNVkXRHHTYxTdNAoagbWp8zZk4Cgn/O
         FY35HcmAzZErNX32DrMQ6N3H9LGEj946TQU0BCAVqrqAf38AW5rfuQuXpXh5gizK0E1R
         E1knr90OPcId0mhcSWXvZ87uAxFL2WAHtIkXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091603; x=1781696403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyiU0NtYK5b/84vtGjMWXa0WSsmy0Dy+Aq8xOK+m4D0=;
        b=ItmTqQe2BQEGKpoKsKD3OvCJ1gobfxk+2rPG1v2pHQv6FttH+OHuivPdZqUZCgvvKx
         SCrD4dGjGKjc82tAadeOz7iFbYFy8SQc2Tk9BGHB/32YeeuoHCorlm1bSEqF39+3FMU7
         VU6J+eXfvOv3BPdP7b1ZrZtWY8ZI2Wt5mM/DCyIaErnB/Hz3XsJBfmYoL3fEmZITJXdZ
         +4s39o06ymyQE1W4ivtV0CPTYC1NNq6URF/Mk1kyFOnzTBecTnoxZIzeeUV7BcWL9q30
         PgKS2nHTqiCzMPOELwGJXum7hmaIYTrXE0LmbFwYvzjL3BSx+ghhtue3kM8KSscXsiar
         eFdg==
X-Gm-Message-State: AOJu0Yw003/YM32GJZR5Jo3Xna4tVdnowuFK/smgDBL178E+fRZQ/AZi
	UtUHPMRDrbcu+sjNeViLtzJCPRjRkpet5DMTgm+zEGxxKqZAzCDZbQEbqW7Wpkt2IjX9sNplR2S
	vucEKcUcAIui6U3n5JmrXP233r1sVIZbvQrgPZxsRxw==
X-Gm-Gg: Acq92OEqNQNebSA8TSjh2lRLLTLv5fefsRx6nQ3HnleM/18e+4yCWsJ+bvIpQoH5wYF
	+9WyMsawUdjlChmE4OKr2l1EGm9qPMXyuurja9RyaNLb8dKxXwGDqgiD0otW9p5IIsDMzFZeqnG
	fipah0M4uLTO1Y0HWdxwpc03pYbMcerjp/CzzyFeWFPvfVXNaDP9qRWcdMJPiFGbd88V/9wqwrl
	E5B3hp0D3K+suiCs111NQYrNQPoKMdPzEU5P/nayDY0GV5BnyyRUdWsJ9W5kGaEZyoxt9bhzXIL
	/dQKE8jRFEMy4fXbxjyRNpRXa7rwy42bWhvKFvNCKRwvAeehGVc=
X-Received: by 2002:ac8:594e:0:b0:517:8d24:64d8 with SMTP id
 d75a77b69052e-517a12d2d76mr313368301cf.13.1781091602767; Wed, 10 Jun 2026
 04:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520031755.2637761-1-jindongyang@kylinos.cn>
In-Reply-To: <20260520031755.2637761-1-jindongyang@kylinos.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 13:39:50 +0200
X-Gm-Features: AVVi8Cf1rAdSGd3cDEyUeGW5yxsFgnWyQXCxKKpnnY60AMrSPVwMC2XrhNvzzc8
Message-ID: <CAJfpegvza+BMDrFcgKA4KYnX-41BkU0ZS6enobHqTH01inYbtg@mail.gmail.com>
Subject: Re: [PATCH] fuse: Use NULL instead of 0 for pointer
To: Dongyang Jin <jindongyang@kylinos.cn>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 05:18, Dongyang Jin <jindongyang@kylinos.cn> wrote:
>
> Pointers should use NULL instead of explicit '0', as pointed out by sparse:
>
> fs/fuse/dev.c:2151:48: Using plain integer as NULL pointer

Thanks, folded patch into original.

Miklos
